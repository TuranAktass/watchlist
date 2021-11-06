import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/network/network_manager.dart';
import '../../model/movie_model.dart';
import '../../service/i_movie_service.dart';
import '../../service/movie_service.dart';

part 'movie_search_view_model.g.dart';

class MovieViewModel = _MovieViewModelBase with _$MovieViewModel;

abstract class _MovieViewModelBase with Store {
  BuildContext? context;
  late IMovieService movieService;

  @observable
  List<MovieModel> items = [];

  @observable
  String searchInput = '';

  @observable
  LifeState pageLifes = LifeState.iddle;

  bool isLoading = false;

  _MovieViewModelBase({this.context});

  void setContext(BuildContext? context) {
    movieService = MovieService(NetworkManager.instance.dio);
    //fetchMoviesBySearch(searchInput);
  }

  @action
  Future<void> fetchMoviesBySearch(String title) async {
    pageLifes = LifeState.loading;
    items = await movieService.fetchMoviesBySearch(title);
    pageLifes = LifeState.done;
  }

  @action
  void setSearchInput(String value) {
    searchInput = value;
    fetchMoviesBySearch(value);
  }
}

enum LifeState {
  iddle,
  loading,
  done,
}
