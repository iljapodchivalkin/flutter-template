import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/webservice/meal/meal_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
abstract class MealsRepository {
  @factoryMethod
  factory MealsRepository(MealService service, LocalStorage storage) = _MealRepository;

  Future<List<Meal>> getMealsByName(String name);

  Future<List<Meal>> getMealsByCategory(String category);

  Future<List<Meal>> getMealsByCountry(String country);

  Future<Meal?> getMealById(String id);

  Future<List<String>> getFavoriteMeals();

  Future<String?> getFavoriteMealById(String id);

  Future<void> addMealToFavorites(String id);

  Future<void> deleteMealFromFavorites(String id);


}

class _MealRepository implements MealsRepository {
  final MealService _service;
  final LocalStorage _storage;

  _MealRepository(this._service, this._storage);

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

  @override
  Future<List<String>> getFavoriteMeals() async {
    final result = await _storage.getFavoriteMeals();
    return result;
  }

  @override
  Future<String?> getFavoriteMealById(String id) async {
    final result = await _storage.getFavoriteMealById(id);
    return result;
  }

  @override
  Future<void> addMealToFavorites(String id) async {
    final result = await _storage.addMealToFavorites(id);
    return result;
  }

  @override
  Future<void> deleteMealFromFavorites(String id) async {
    final result = await _storage.deleteMealFromFavorites(id);
    return result;
  }
}
