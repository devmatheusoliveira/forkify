// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_tile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecipeTileModel _$RecipeTileModelFromJson(Map<String, dynamic> json) =>
    RecipeTileModel(
      json['publisher'] as String,
      json['title'] as String,
      json['recipe_id'] as String,
      json['image_url'] as String,
      json['publisher_url'] as String,
      (json['social_rank'] as num).toInt(),
    );

Map<String, dynamic> _$RecipeTileModelToJson(RecipeTileModel instance) =>
    <String, dynamic>{
      'publisher': instance.publisher,
      'title': instance.title,
      'recipe_id': instance.recipe_id,
      'image_url': instance.image_url,
      'publisher_url': instance.publisher_url,
      'social_rank': instance.social_rank,
    };
