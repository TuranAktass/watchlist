import "package:flutter/material.dart";

import '../../../viewmodel/movie_search/movie_search_view_model.dart';
import 'search_input_field.dart';

class HeaderWithSearchBox extends StatelessWidget {
  const HeaderWithSearchBox({
    Key? key,
    required this.size,
    required MovieViewModel viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final Size size;
  final MovieViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.33,
      child: Stack(
        children: [
          Header(size: size),
          Positioned(
              top: size.height * 0.25,
              left: size.width * 0.15,
              child: SearchInputField(size: size, viewModel: _viewModel)),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.3,
      decoration: const BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
    );
  }
}
