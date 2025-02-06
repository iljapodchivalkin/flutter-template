import 'package:flutter_template/model/webservice/meal/meal.dart';

// ignore: one_member_abstracts
abstract class MealService {
  Future<List<Meal>> getMeals();
}

