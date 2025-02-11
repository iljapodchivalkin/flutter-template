// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['idMeal', 'strMeal', 'strMealThumb'],
  );
  return Meal(
    id: json['idMeal'] as String,
    name: json['strMeal'] as String,
    image: json['strMealThumb'] as String,
    country: json['strArea'] as String?,
    category: json['strCategory'] as String?,
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'idMeal': instance.id,
      'strMeal': instance.name,
      'strMealThumb': instance.image,
      if (instance.country case final value?) 'strArea': value,
      if (instance.category case final value?) 'strCategory': value,
    };
