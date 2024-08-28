// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'HomeBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isSearchingAtom =
      Atom(name: 'HomeBase.isSearching', context: context);

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  late final _$errorAtom = Atom(name: 'HomeBase.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$recipeTilesAtom =
      Atom(name: 'HomeBase.recipeTiles', context: context);

  @override
  ObservableList<RecipeTileModel> get recipeTiles {
    _$recipeTilesAtom.reportRead();
    return super.recipeTiles;
  }

  @override
  set recipeTiles(ObservableList<RecipeTileModel> value) {
    _$recipeTilesAtom.reportWrite(value, super.recipeTiles, () {
      super.recipeTiles = value;
    });
  }

  late final _$refreshAsyncAction =
      AsyncAction('HomeBase.refresh', context: context);

  @override
  Future<void> refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  late final _$HomeBaseActionController =
      ActionController(name: 'HomeBase', context: context);

  @override
  void setRecipeTiles(List<RecipeTileModel> value) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.setRecipeTiles');
    try {
      return super.setRecipeTiles(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSearchState(bool value) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.setSearchState');
    try {
      return super.setSearchState(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHasError(String? value) {
    final _$actionInfo =
        _$HomeBaseActionController.startAction(name: 'HomeBase.setHasError');
    try {
      return super.setHasError(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingState(bool value) {
    final _$actionInfo = _$HomeBaseActionController.startAction(
        name: 'HomeBase.setLoadingState');
    try {
      return super.setLoadingState(value);
    } finally {
      _$HomeBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isSearching: ${isSearching},
error: ${error},
recipeTiles: ${recipeTiles}
    ''';
  }
}
