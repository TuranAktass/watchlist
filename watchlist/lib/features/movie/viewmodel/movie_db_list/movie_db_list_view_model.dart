import "package:flutter/material.dart";
import 'package:mobx/mobx.dart';
import 'package:watchlist/core/database/database_manager.dart';
import 'package:watchlist/features/movie/model/movie_db_model.dart';

part 'movie_db_list_view_model.g.dart';

class MovieDbListViewModel = _MovieDbListViewModelBase
    with _$MovieDbListViewModel;

abstract class _MovieDbListViewModelBase with Store {
  BuildContext? context;

  @observable
  List<MovieDbModel> list = [];

  @observable
  LifeState pageLifes = LifeState.iddle;

  void setContext(BuildContext? context) {
    getMovies();
    this.context = context;
  }

  @action
  Future<void> getMovies() async {
    pageLifes = LifeState.loading;
    list = await MovieDatabase.instance.readAllMovies();
    pageLifes = LifeState.done;
  }

  @action
  Future<void> getWatchedMovies() async {
    pageLifes = LifeState.loading;
    list = await MovieDatabase.instance.readWatchedMovies();
    pageLifes = LifeState.done;
  }
}

enum LifeState {
  iddle,
  loading,
  done,
}
