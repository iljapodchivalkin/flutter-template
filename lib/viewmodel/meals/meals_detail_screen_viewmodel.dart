//import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/navigator/main_navigator.navigator.dart';
import 'package:flutter_template/repository/meals/meals_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class MealsDetailScreenViewmodel with ChangeNotifierEx {
  late final String _mealId;

  final MainNavigator _navigator;
  final MealsRepository _mealsRepo;
  Meal? _meal;

  String? get mealName => _meal?.name;

  String? get mealImage => _meal?.image;

  String? get mealInstructions => _meal?.instructions;

  MealsDetailScreenViewmodel(
    this._navigator,
    this._mealsRepo,
  );

  Future<void> init(String id) async {
    _mealId = id;
    await _initMeal();
  }

  void onBackButtonClicked() => _navigator.goBackTo(RouteNames.mealsScreen);

  Future<void> _initMeal() async {
    final meal = await _mealsRepo.getMealById(_mealId);
    _meal = meal;
    if (disposed) return;
    notifyListeners();
  }
}
