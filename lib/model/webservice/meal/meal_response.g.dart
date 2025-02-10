// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealResponse _$MealResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['meals'],
  );
  return MealResponse(
    meals: (json['meals'] as List<dynamic>)
        .map((e) => Meal.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MealResponseToJson(MealResponse instance) =>
    <String, dynamic>{
      'meals': instance.meals.map((e) => e.toJson()).toList(),
    };
