// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:flutter_template/model/webservice/meal/meal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MealResponse {
  @JsonKey(name: 'meals', required: true)
  final List<Meal> meals;

  const MealResponse({
    required this.meals,
  });

  factory MealResponse.fromJson(Map<String, dynamic> json) => _$MealResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealResponseToJson(this);

}
