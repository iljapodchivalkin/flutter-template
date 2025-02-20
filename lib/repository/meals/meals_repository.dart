import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:flutter_template/repository/shared_prefs/local/local_storage.dart';
import 'package:flutter_template/webservice/meal/meal_service.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
abstract class MealsRepository {
  @factoryMethod
  factory MealsRepository(MealService service, LocalStorage storage) = _MealRepository;

  Future<List<Meal>> getMealsByName(String name);

  Future<List<Meal>> getMealsByCategory(String category);

  Future<List<Meal>> getMealsByCountry(String country);

  Future<Meal?> getMealById(String id);

  List<Meal> getFavoriteMealsList();

  Future<Meal?> getFavoriteMealById(String id);

  Future<void> addMealToFavorites(Meal meal);

  Future<void> deleteMealFromFavorites(String id);

  Stream<List<Meal>> get favoriteMealStream;
}

class _MealRepository implements MealsRepository {
  final MealService _service;
  final LocalStorage _storage;

  final _favoriteMealStream = BehaviorSubject<List<Meal>>();

  @override
  Stream<List<Meal>> get favoriteMealStream => _favoriteMealStream.stream;

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
  List<Meal> getFavoriteMealsList() => _storage.getFavoriteMeals();
  

  @override
  Future<void> addMealToFavorites(Meal meal) async {
    final result = await _storage.addMealToFavorites(meal);
    _favoriteMealStream.add(result);
  }

  @override
  Future<void> deleteMealFromFavorites(String id) async {
    final result = await _storage.deleteMealFromFavorites(id);
    _favoriteMealStream.add(result);
  }

  //voor het ophalen van de favoriete meal zelf
  @override
  Future<Meal?> getFavoriteMealById(String id) async {
    final foundMeal = await _storage.getFavoriteMealById(id);
    return foundMeal;
  }
}
