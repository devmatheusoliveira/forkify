// ignore_for_file: non_constant_identifier_names
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'recipe_details_model.g.dart';

@JsonSerializable()
class RecipeDetailsModel {
  final String publisher,
      title,
      recipe_id,
      image_url,
      publisher_url,
      source_url;
  final int social_rank;
  final List<String> ingredients;

  RecipeDetailsModel(
    this.publisher,
    this.title,
    this.recipe_id,
    this.image_url,
    this.publisher_url,
    this.social_rank,
    this.source_url,
    this.ingredients,
  );

  factory RecipeDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeDetailsModelToJson(this);
}
