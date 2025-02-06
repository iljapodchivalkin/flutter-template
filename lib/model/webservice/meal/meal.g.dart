// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Meal _$MealFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['id', 'name', 'country', 'category', 'image'],
  );
  return Meal(
    id: json['id'] as String,
    name: json['name'] as String,
    country: json['country'] as String,
    category: json['category'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$MealToJson(Meal instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'category': instance.category,
      'image': instance.image,
    };
