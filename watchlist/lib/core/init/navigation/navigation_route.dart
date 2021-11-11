import 'package:flutter/material.dart';
import 'package:watchlist/core/components/page_not_found.dart';
import 'package:watchlist/features/movie/view/movie_db_list_view/movie_db_list_view.dart';
import 'package:watchlist/features/movie/view/movie_search_view/movie_search_view.dart';

import '../../../features/movie/view/home_view/home_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> onGenerateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.homeView:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case NavigationConstants.dbMovieList:
        return MaterialPageRoute(builder: (context) => MovieDbListView());
      case NavigationConstants.movieSearch:
        return MaterialPageRoute(builder: (context) => MovieSearchView());
      default:
        return MaterialPageRoute(builder: (context) => const PageNotFound());
    }
  }
}
