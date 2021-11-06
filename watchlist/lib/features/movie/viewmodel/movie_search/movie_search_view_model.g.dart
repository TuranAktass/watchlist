// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_search_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieViewModel on _MovieViewModelBase, Store {
  final _$itemsAtom = Atom(name: '_MovieViewModelBase.items');

  @override
  List<MovieModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(List<MovieModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  final _$searchInputAtom = Atom(name: '_MovieViewModelBase.searchInput');

  @override
  String get searchInput {
    _$searchInputAtom.reportRead();
    return super.searchInput;
  }

  @override
  set searchInput(String value) {
    _$searchInputAtom.reportWrite(value, super.searchInput, () {
      super.searchInput = value;
    });
  }

  final _$pageLifesAtom = Atom(name: '_MovieViewModelBase.pageLifes');

  @override
  LifeState get pageLifes {
    _$pageLifesAtom.reportRead();
    return super.pageLifes;
  }

  @override
  set pageLifes(LifeState value) {
    _$pageLifesAtom.reportWrite(value, super.pageLifes, () {
      super.pageLifes = value;
    });
  }

  final _$fetchMoviesBySearchAsyncAction =
      AsyncAction('_MovieViewModelBase.fetchMoviesBySearch');

  @override
  Future<void> fetchMoviesBySearch(String title) {
    return _$fetchMoviesBySearchAsyncAction
        .run(() => super.fetchMoviesBySearch(title));
  }

  final _$_MovieViewModelBaseActionController =
      ActionController(name: '_MovieViewModelBase');

  @override
  void setSearchInput(String value) {
    final _$actionInfo = _$_MovieViewModelBaseActionController.startAction(
        name: '_MovieViewModelBase.setSearchInput');
    try {
      return super.setSearchInput(value);
    } finally {
      _$_MovieViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
searchInput: ${searchInput},
pageLifes: ${pageLifes}
    ''';
  }
}
