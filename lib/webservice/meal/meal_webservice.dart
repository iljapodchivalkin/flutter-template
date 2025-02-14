import 'package:dio/dio.dart';
import 'package:flutter_template/model/webservice/meal/meal_response.dart';

import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_template/webservice/meal/meal_service.dart';
part 'meal_webservice.g.dart';

@Singleton(as: MealService)
@RestApi()
abstract class MealWebService extends MealService {
  @factoryMethod
  factory MealWebService(Dio dio) = _MealWebService;

  @override
  @GET('search.php')
  Future<MealResponse> getMealsByName({@Query('s') required name});

  @override
  @GET('filter.php')
  Future<MealResponse> getMealsByCountry({@Query('a') required country});

  @override
  @GET('filter.php')
  Future<MealResponse> getMealsByCategory({@Query('c') required category});

  @override
  @GET('lookup.php')
  Future<MealResponse> getMealById({@Query('i') required id});

}

