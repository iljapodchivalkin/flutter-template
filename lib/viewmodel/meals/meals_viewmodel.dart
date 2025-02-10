import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:flutter_template/navigator/main_navigator.dart';
import 'package:flutter_template/repository/meals/meals_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class MealsViewModel with ChangeNotifierEx {
  // ignore: unused_field
  final MainNavigator _navigator;
  final MealsRepository _mealsRepo;

  final _meals = <Meal>[];

  List<Meal> get meals => _meals;

  MealsViewModel(
    this._navigator,
    this._mealsRepo,
  );

  Future<void> init() async {
    await _getMealsByName('taco');
  }

  Future<void> searchMealByName(String name) async {
    await _getMealsByName(name);
  }

  Future<void> _getMealsByName(String name) async {
    final meals = await _mealsRepo.getMealsByName(name);
    _meals.replaceAll(meals);
    if (disposed) return;
    notifyListeners();
  }
}
