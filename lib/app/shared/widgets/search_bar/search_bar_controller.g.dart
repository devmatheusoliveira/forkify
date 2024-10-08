// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_bar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchBarController on SearchBarBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'SearchBarBase.isLoading', context: context);

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
      Atom(name: 'SearchBarBase.isSearching', context: context);

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

  late final _$SearchBarBaseActionController =
      ActionController(name: 'SearchBarBase', context: context);

  @override
  void setSearchState(bool value) {
    final _$actionInfo = _$SearchBarBaseActionController.startAction(
        name: 'SearchBarBase.setSearchState');
    try {
      return super.setSearchState(value);
    } finally {
      _$SearchBarBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoadingState(bool value) {
    final _$actionInfo = _$SearchBarBaseActionController.startAction(
        name: 'SearchBarBase.setLoadingState');
    try {
      return super.setLoadingState(value);
    } finally {
      _$SearchBarBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
isSearching: ${isSearching}
    ''';
  }
}
