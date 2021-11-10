import "package:flutter/material.dart";
import 'package:watchlist/features/movie/view/movie_search_view/movie_search_view.dart';

import '../../../../core/color/constant_colors.dart';
import '../../viewmodel/home/home_view_model.dart';
import 'components/header_row.dart';
import 'components/movie_poster_list.dart';
import 'components/text_with_iconbutton.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    if (_viewModel.context == null) {
      _viewModel.setContext(context);
    }
    return Scaffold(
        body: Container(
      color: backgroundDark,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Expanded(flex: 1, child: HeaderRow()),
            Expanded(
              flex: 2,
              child: MoviePosterList(viewModel: _viewModel),
            ),
            const Expanded(flex: 1, child: TextWithIconButton()),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ElevatedButton(
                      child: const Text(
                        "Search",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieSearchView()));
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
