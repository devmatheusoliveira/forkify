// ignore_for_file: non_constant_identifier_names
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'recipe_tile_model.g.dart';

@JsonSerializable()
class RecipeTileModel {
  final String publisher, title, recipe_id, image_url, publisher_url;
  final int social_rank;

  RecipeTileModel(
    this.publisher,
    this.title,
    this.recipe_id,
    this.image_url,
    this.publisher_url,
    this.social_rank,
  );

  factory RecipeTileModel.fromJson(Map<String, dynamic> json) =>
      _$RecipeTileModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeTileModelToJson(this);
}
