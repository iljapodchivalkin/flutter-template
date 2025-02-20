import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/meals/meals_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class FavoriteMealsViewModel with ChangeNotifierEx {
  final MainNavigator _navigator;
  final MealsRepository _mealsRepo;

  final _favoriteMeals = <Meal>[];

  List<Meal> get favoriteMeals => _favoriteMeals;

  FavoriteMealsViewModel(
    this._navigator,
    this._mealsRepo,
  );

  Future<void> init() async {
    registerDisposeStream(_mealsRepo.favoriteMealStream.listen(onData));
    getAllFavoriteMeals();
  }

  Future<void> onData(List<Meal> dataList) async {
    _favoriteMeals.replaceAll(dataList);
    if (disposed) return;
    notifyListeners();
  }

  bool isMealFavorite(Meal meal) => _favoriteMeals.contains(meal);

  //favorite button click
  Future<void> onFavoriteButtonClicked(Meal meal) async {
    if (isMealFavorite(meal)) {
      await _mealsRepo.deleteMealFromFavorites(meal.id);
    } else {
      await _mealsRepo.addMealToFavorites(meal);
    }
  }

  void getAllFavoriteMeals() {
    _favoriteMeals.replaceAll(_mealsRepo.getFavoriteMealsList());
    if (disposed) return;
    notifyListeners();
  }

  void onMealCardTapped(Meal meal) => _navigator.goToMealDetailScreen(mealId: meal.id);
}
