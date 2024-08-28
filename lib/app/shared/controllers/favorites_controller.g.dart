// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavoritesController on FavoritesBase, Store {
  late final _$itemCountAtom =
      Atom(name: 'FavoritesBase.itemCount', context: context);

  @override
  int get itemCount {
    _$itemCountAtom.reportRead();
    return super.itemCount;
  }

  @override
  set itemCount(int value) {
    _$itemCountAtom.reportWrite(value, super.itemCount, () {
      super.itemCount = value;
    });
  }

  late final _$recipeTilesAtom =
      Atom(name: 'FavoritesBase.recipeTiles', context: context);

  @override
  ObservableList<String> get recipeTiles {
    _$recipeTilesAtom.reportRead();
    return super.recipeTiles;
  }

  @override
  set recipeTiles(ObservableList<String> value) {
    _$recipeTilesAtom.reportWrite(value, super.recipeTiles, () {
      super.recipeTiles = value;
    });
  }

  late final _$refreshCountAsyncAction =
      AsyncAction('FavoritesBase.refreshCount', context: context);

  @override
  Future<void> refreshCount() {
    return _$refreshCountAsyncAction.run(() => super.refreshCount());
  }

  late final _$removeAsyncAction =
      AsyncAction('FavoritesBase.remove', context: context);

  @override
  Future<void> remove(String value) {
    return _$removeAsyncAction.run(() => super.remove(value));
  }

  late final _$FavoritesBaseActionController =
      ActionController(name: 'FavoritesBase', context: context);

  @override
  void add(dynamic value) {
    final _$actionInfo =
        _$FavoritesBaseActionController.startAction(name: 'FavoritesBase.add');
    try {
      return super.add(value);
    } finally {
      _$FavoritesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemCount: ${itemCount},
recipeTiles: ${recipeTiles}
    ''';
  }
}
