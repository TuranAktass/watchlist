import "package:flutter/material.dart";
import 'package:watchlist/features/movie/viewmodel/movie_search/movie_search_view_model.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    Key? key,
    required MovieViewModel viewModel,
    required this.size,
  })  : _viewModel = viewModel,
        super(key: key);

  final Size size;
  final MovieViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * 0.7,
      child: TextField(
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: const Icon(Icons.search),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
        onChanged: (value) {
          _viewModel.setSearchInput(value);
          _viewModel.fetchMoviesBySearch(value);
        },
      ),
    );
  }
}
