import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:watchlist/features/movie/view/movie_details_view/movie_details_view.dart';
import 'package:watchlist/features/movie/viewmodel/home/home_view_model.dart';

class MoviePosterList extends StatelessWidget {
  const MoviePosterList({
    Key? key,
    required HomeViewModel viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final HomeViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _viewModel.items.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MovieDetailsView(model: _viewModel.items[index]))),
              child: Image.network(
                _viewModel.items[index].poster!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
