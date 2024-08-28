// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeDetailsModel _$RecipeDetailsModelFromJson(Map<String, dynamic> json) =>
    RecipeDetailsModel(
      json['publisher'] as String,
      json['title'] as String,
      json['recipe_id'] as String,
      json['image_url'] as String,
      json['publisher_url'] as String,
      (json['social_rank'] as num).toInt(),
      json['source_url'] as String,
      (json['ingredients'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RecipeDetailsModelToJson(RecipeDetailsModel instance) =>
    <String, dynamic>{
      'publisher': instance.publisher,
      'title': instance.title,
      'recipe_id': instance.recipe_id,
      'image_url': instance.image_url,
      'publisher_url': instance.publisher_url,
      'source_url': instance.source_url,
      'social_rank': instance.social_rank,
      'ingredients': instance.ingredients,
    };
