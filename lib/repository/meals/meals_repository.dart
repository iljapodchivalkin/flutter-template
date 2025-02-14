import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:flutter_template/webservice/meal/meal_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class MealsRepository {
  @factoryMethod
  factory MealsRepository(MealService service) = _MealRepository;

  Future<List<Meal>> getMealsByName(String name);

  Future<List<Meal>> getMealsByCategory(String category);

  Future<List<Meal>> getMealsByCountry(String country);

  Future<Meal?> getMealById(String id);
}

class _MealRepository implements MealsRepository {
  final MealService _service;

  _MealRepository(this._service);

  @override
  Future<List<Meal>> getMealsByName(String name) async {
    final result = await _service.getMealsByName(name: name);
    return result.meals ?? [];
  }

  @override
  Future<List<Meal>> getMealsByCountry(String country) async {
    final result = await _service.getMealsByCountry(country: country);
    return result.meals ?? [];
  }

  @override
  Future<List<Meal>> getMealsByCategory(String category) async {
    final result = await _service.getMealsByCategory(category: category);
    return result.meals ?? [];
  }

  @override
  Future<Meal?> getMealById(String id) async {
    final result = await _service.getMealById(id: id);
    return result.meals?.first;
  }
}
