import 'dart:async';

import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/meals/meals_repository.dart';
import 'package:flutter_template/util/locale/localization_keys.dart';
import 'package:flutter_template/util/logging/flutter_template_logger.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

enum MealFilterOptions {
  name(labelKey: LocalizationKeys.searchByDishName),
  country(labelKey: LocalizationKeys.searchByCountry),
  category(labelKey: LocalizationKeys.searchByCategory);

  final String labelKey;

  const MealFilterOptions({required this.labelKey});
}

@injectable
class MealsViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final MealsRepository _mealsRepo;

  final _meals = <Meal>[];
  //final _allFavoriteIds = <String>[];

  bool _isLoading = false;
  MealFilterOptions? _selectedType;

  List<Meal> get meals => _meals;

  final _favoriteMeals = <Meal>[];

  List<Meal> get favoriteMeals => _favoriteMeals;

  bool get isLoading => _isLoading;

  MealsViewModel(
    this._navigator,
    this._mealsRepo,
  );

  Future<void> init() async {
    registerDisposeStream(_mealsRepo.favoriteMealStream.listen(onData));
    await getAllFavoriteMeals();
  }

  Future<void> onData(List<Meal> dataList) async {
    await getAllFavoriteMeals(dataList);
  }

  //voor de "gewone" meals
  Future<void> searchMeal(String input) async {
    _setLoading(true);
    switch (_selectedType) {
      case MealFilterOptions.name:
        await _getMealsByName(input);
        break;
      case MealFilterOptions.country:
        await _getMealsByCountry(input);
        break;
      case MealFilterOptions.category:
        await _getMealsByCategory(input);
        break;
      case null:
        break;
    }
    _setLoading(false);
  }

  Future<void> _getMealsByName(String name) => _getMeals(() => _mealsRepo.getMealsByName(name));

  Future<void> _getMealsByCountry(String country) => _getMeals(() => _mealsRepo.getMealsByCountry(country));

  Future<void> _getMealsByCategory(String category) => _getMeals(() => _mealsRepo.getMealsByCategory(category));

  Future<void> _getMeals(Future<List<Meal>> Function() callback) async {
    try {
      final meals = await callback();
      _meals.replaceAll(meals);
      if (disposed) return;
      notifyListeners();
    } catch (e, trace) {
      FlutterTemplateLogger.logError(
        'Failed to get meal',
        error: e,
        stackTrace: trace,
      );
      _setLoading(false);
    }
  }

  void onTypeSelected(MealFilterOptions? type) {
    _selectedType = type;
  }

  void onMealCardTapped(Meal meal) => _navigator.goToMealDetailScreen(mealId: meal.id);

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isMealFavorite(Meal meal) {
    final contains =  _favoriteMeals.where((favoriteMeal) => favoriteMeal.id == meal.id).isNotEmpty;
    return contains;
  }

  //favorite button click
  Future<void> onFavoriteButtonClicked(Meal meal) async {
    if (isMealFavorite(meal)) {
      await _mealsRepo.deleteMealFromFavorites(meal.id);
    } else {
      await _mealsRepo.addMealToFavorites(meal);
    }
  }

  //voor het verkrijgen van de favoriete meals zelf
  Future<void> getAllFavoriteMeals([List<Meal>? favoriteMealIds]) async {
    _favoriteMeals.replaceAll(_mealsRepo.getFavoriteMealsList());
    if (disposed) return;
    notifyListeners();
  }
}
