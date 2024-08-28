import 'dart:convert';

import 'package:forkify_app/app/shared/models/recipe_tile/recipe_tile_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'recipe_list_tile_controller.g.dart';

class RecipeListTileController = RecipeListTileBase
    with _$RecipeListTileController;

abstract class RecipeListTileBase with Store {
  @observable
  bool isFavorite = false;
  @action
  void setIsFavotite(bool value) => isFavorite = value;
  @action
  Future<void> verifyFavoritesList(RecipeTileModel value) async {
    final prefs = await SharedPreferences.getInstance();
    var favoritos = prefs.getStringList("favoritos")!;
    isFavorite = favoritos.contains(jsonEncode(value));
  }
}
