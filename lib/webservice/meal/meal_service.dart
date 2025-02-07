import 'package:flutter_template/model/webservice/meal/meal.dart';

// ignore: one_member_abstracts
abstract class MealService {
  Future<List<Meal>> getMealsByName({required String name});

  Future<List<Meal>> getMealsByCountry({required String country});

  Future<List<Meal>> getMealsByCategory({required String category});
}

