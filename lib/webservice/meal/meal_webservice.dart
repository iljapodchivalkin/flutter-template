import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:flutter_template/webservice/meal/meal_service.dart';
part 'meal_webservice.g.dart';

@Singleton(as: MealService)
@RestApi()
abstract class MealWebService extends MealService {
  @factoryMethod
  factory MealWebService(Dio dio) = _MealWebService;

  @override
  @GET('/meals')
  Future<List<Meal>> getMeals();
}

