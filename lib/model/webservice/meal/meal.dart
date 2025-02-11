// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable(explicitToJson: true)
class Meal {
  @JsonKey(name: 'idMeal', required: true)
  final String id;
  @JsonKey(name: 'strMeal', required: true)
  final String name;
  @JsonKey(name: 'strMealThumb', required: true)
  final String image;
  @JsonKey(name: 'strArea', includeIfNull: false)
  final String? country;
  @JsonKey(name: 'strCategory', includeIfNull: false)
  final String? category;

  const Meal({
    required this.id,
    required this.name,
    required this.image,
    this.country,
    this.category,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

  Map<String, dynamic> toJson() => _$MealToJson(this);

}
