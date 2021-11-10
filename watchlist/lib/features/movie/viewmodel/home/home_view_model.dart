import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:watchlist/core/database/database_manager.dart';
import 'package:watchlist/features/movie/model/movie_db_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store {
  BuildContext? context;

  @observable
  List<MovieDbModel> items = [];

  @observable
  LifeState pageLifes = LifeState.iddle;

  bool isLoading = false;

  _HomeViewModelBase({this.context});

  void setContext(BuildContext? context) {
    getMovies();
  }

  @action
  Future<void> getMovies() async {
    pageLifes = LifeState.loading;

    items = await MovieDatabase.instance.readAllMovies();

    pageLifes = LifeState.done;
  }
}

enum LifeState {
  iddle,
  loading,
  done,
}
