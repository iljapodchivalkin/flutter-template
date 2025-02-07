// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable(explicitToJson: true)
class Meal {
  @JsonKey(name: 'idMeal', required: true)
  final String id;
  @JsonKey(name: 'strMeal', required: true)
  final String name;
  @JsonKey(name: 'strArea', required: true)
  final String country;
  @JsonKey(name: 'strCategory', required: true)
  final String category;
  @JsonKey(name: 'strMealThumb', required: true)
  final String image;

  const Meal({
    required this.id,
    required this.name,
    required this.country,
    required this.category,
    required this.image,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);

}
