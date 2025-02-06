// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:json_annotation/json_annotation.dart';

part 'meal.g.dart';

@JsonSerializable(explicitToJson: true)
class Meal {
  @JsonKey(name: 'id', required: true)
  final String id;
  @JsonKey(name: 'name', required: true)
  final String name;
  @JsonKey(name: 'country', required: true)
  final String country;
  @JsonKey(name: 'category', required: true)
  final String category;
  @JsonKey(name: 'image', required: true)
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
