import "package:flutter/material.dart";
import 'package:watchlist/core/components/navigation/nav_bar_alt.dart';

import '../../viewmodel/movie_search/movie_search_view_model.dart';
import 'components/header.dart';
import 'components/search_results_listview.dart';

class MovieSearchView extends StatelessWidget {
  MovieSearchView({Key? key}) : super(key: key);

  final MovieViewModel _viewModel = MovieViewModel();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (_viewModel.context == null) {
      _viewModel.setContext(context);
    }
    return Scaffold(
        bottomNavigationBar: const AltNavBar(routeIndex: 1),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HeaderWithSearchBox(size: size, viewModel: _viewModel),
            Expanded(
              child: SearchResultsListView(
                viewModel: _viewModel,
              ),
            ),
          ],
        ));
  }
}
