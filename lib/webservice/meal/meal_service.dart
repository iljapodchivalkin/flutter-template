//import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:flutter_template/model/webservice/meal/meal_response.dart';

// ignore: one_member_abstracts
abstract class MealService {
  Future<MealResponse> getMealsByName({required String name});

  Future<MealResponse> getMealsByCountry({required String country});

  Future<MealResponse> getMealsByCategory({required String category});

  Future<MealResponse> getMealById({required String id});
}

