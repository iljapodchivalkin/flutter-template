import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/meals/meals_repository.dart';
import 'package:flutter_template/util/logging/flutter_template_logger.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteMealsViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final MealsRepository _mealsRepo;

  final _favoriteMeals = <Meal>[];
  final _allFavoriteIds = <String>[];

  List<Meal> get favoriteMeals => _favoriteMeals;

  List<String> get allFavoriteIds => _allFavoriteIds;

  FavoriteMealsViewModel(
    this._navigator,
    this._mealsRepo,
  );

  Future<void> init() async {
    registerDisposeStream(_mealsRepo.favoriteMealStream.listen(onData));
    await getAllFavoriteMeals();
  }

  Future<void> onData(List<String> dataList) async {
    await getAllFavoriteMeals(dataList);
  }

  bool isMealFavorite(String id) => _allFavoriteIds.contains(id);

  //favorite button click
  Future<void> onFavoriteButtonClicked(String id) async {
    if (isMealFavorite(id)) {
      await _mealsRepo.deleteMealFromFavorites(id);
    } else {
      await _mealsRepo.addMealToFavorites(id);
    }
  }

  //voor het verkrijgen van de favoriete meals zelf
  Future<void> getAllFavoriteMeals([List<String>? dataList]) async {
    final allFavoriteIds = dataList ?? await _mealsRepo.getFavoriteMealsList();
    final tempList = <Meal>[];
    for (final id in allFavoriteIds) {
      try {
        final foundMeal = await _mealsRepo.getFavoriteMealById(id);
        if (foundMeal == null) {
          throw ArgumentError('Meal is null');
        }
        tempList.add(foundMeal);
      } catch (e, trace) {
        FlutterTemplateLogger.logError('Error: failed to get meal with id $id', error: e, stackTrace: trace);
      }
    }
    _favoriteMeals.replaceAll(tempList);
    _allFavoriteIds.replaceAll(allFavoriteIds);
    if (disposed) return;
    notifyListeners();
  }

  void onMealCardTapped(Meal meal) => _navigator.goToMealDetailScreen(mealId: meal.id);
}
