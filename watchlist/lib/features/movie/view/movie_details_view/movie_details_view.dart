import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';

import '../../../../core/constants/const_padding.dart';
import '../../model/movie_model.dart';
import 'components/card/plot_card.dart';
import 'components/informatin_poster_stack.dart';
import 'components/view/title_director_genre_view.dart';

// ignore: must_be_immutable
class MovieDetailsView extends StatefulWidget {
  MovieModel model;

  MovieDetailsView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  PaletteGenerator? palette;
  Color? color;
  bool isLoading = false;
  List<String>? genres;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    genres = widget.model.genre!.split(',');

    return Scaffold(
      body: Container(
        color: const Color(0xff0E0D0D),
        child: SingleChildScrollView(
          child: Column(children: [
            InformationAndPosterView(
              poster: widget.model.poster!,
              runtime: widget.model.runtime!,
              year: widget.model.year!,
              imdbRating: widget.model.imdbRating!,
            ),
            const Padding(padding: padding20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TitleDirectorGenreView(
                      title: widget.model.title!,
                      director: widget.model.director!,
                      genres: genres),
                  const Padding(padding: padding20),
                  PlotCard(text: widget.model.plot!, size: size),
                ],
              ),
            ),
            const Padding(padding: padding20),
          ]),
        ),
      ),
    );
  }
}
