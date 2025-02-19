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

  Future<List<String>> getFavoriteMealsList();

  Future<Meal?> getFavoriteMealById(String id);

  Future<void> addMealToFavorites(String id);

  Future<void> deleteMealFromFavorites(String id);

  Future<bool> isMealFavorite(String id);

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

  //voor lijst met favoriete id's
  @override
  Future<List<String>> getFavoriteMealsList() async {
    final result = await _storage.getFavoriteMeals();
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

  @override
  Future<bool> isMealFavorite(String id) async {
    final favoriteMeals =  await _storage.getFavoriteMeals();
    return favoriteMeals.contains(id);
  }

  //voor het ophalen van de favoriete meal zelf
  @override
  Future<Meal?> getFavoriteMealById(String? id) async {
    final foundId = await _storage.getFavoriteMealById(id);
    final result = await _service.getMealById(id: foundId!);
    return result.meals?.first;
  }
}
