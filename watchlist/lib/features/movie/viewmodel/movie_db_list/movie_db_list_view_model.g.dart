// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_db_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieDbListViewModel on _MovieDbListViewModelBase, Store {
  final _$listAtom = Atom(name: '_MovieDbListViewModelBase.list');

  @override
  List<MovieDbModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<MovieDbModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$pageLifesAtom = Atom(name: '_MovieDbListViewModelBase.pageLifes');

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

  final _$getMoviesAsyncAction =
      AsyncAction('_MovieDbListViewModelBase.getMovies');

  @override
  Future<void> getMovies() {
    return _$getMoviesAsyncAction.run(() => super.getMovies());
  }

  final _$getWatchedMoviesAsyncAction =
      AsyncAction('_MovieDbListViewModelBase.getWatchedMovies');

  @override
  Future<void> getWatchedMovies() {
    return _$getWatchedMoviesAsyncAction.run(() => super.getWatchedMovies());
  }

  @override
  String toString() {
    return '''
list: ${list},
pageLifes: ${pageLifes}
    ''';
  }
}
