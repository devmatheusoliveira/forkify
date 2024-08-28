// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_list_tile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecipeListTileController on RecipeListTileBase, Store {
  late final _$isFavoriteAtom =
      Atom(name: 'RecipeListTileBase.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$verifyFavoritesListAsyncAction =
      AsyncAction('RecipeListTileBase.verifyFavoritesList', context: context);

  @override
  Future<void> verifyFavoritesList(RecipeTileModel value) {
    return _$verifyFavoritesListAsyncAction
        .run(() => super.verifyFavoritesList(value));
  }

  late final _$RecipeListTileBaseActionController =
      ActionController(name: 'RecipeListTileBase', context: context);

  @override
  void setIsFavotite(bool value) {
    final _$actionInfo = _$RecipeListTileBaseActionController.startAction(
        name: 'RecipeListTileBase.setIsFavotite');
    try {
      return super.setIsFavotite(value);
    } finally {
      _$RecipeListTileBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFavorite: ${isFavorite}
    ''';
  }
}
