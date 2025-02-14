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
  // ignore: unused_field
  final MainNavigator _navigator;
  final MealsRepository _mealsRepo;

  final _meals = <Meal>[];
  MealFilterOptions? _selectedType;

  List<Meal> get meals => _meals;

  MealsViewModel(
    this._navigator,
    this._mealsRepo,
  );

  Future<void> init() async {}

  Future<void> searchMeal(String input) async => switch (_selectedType) {
        MealFilterOptions.name => await _getMealsByName(input),
        MealFilterOptions.country => await _getMealsByCountry(input),
        MealFilterOptions.category => await _getMealsByCategory(input),
        null => () {},
      };

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
    }
  }

  void onTypeSelected(MealFilterOptions? type) {
    _selectedType = type;
  }

  void onMealCardTapped(Meal meal) => _navigator.goToMealDetailScreen(mealId: meal.id);
}
