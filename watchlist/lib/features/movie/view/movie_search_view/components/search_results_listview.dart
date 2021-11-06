import "package:flutter/material.dart";
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../model/movie_model.dart';
import '../../../viewmodel/movie_search/movie_search_view_model.dart';
import '../../movie_details_view/movie_details_view.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({
    Key? key,
    required MovieViewModel viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final MovieViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return ListView.builder(
          itemCount: _viewModel.items.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () async {
                MovieModel model = await _viewModel.movieService
                    .fetchMovieWithDetails(_viewModel.items[index].title!,
                        _viewModel.items[index].year!);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MovieDetailsView(model: model)));
              },
              leading: Image.network(
                _viewModel.items[index].poster!,
              ),
              title: Text(_viewModel.items[index].title!),
              subtitle: Text(_viewModel.items[index].year!),
            ));
          });
    });
  }
}
