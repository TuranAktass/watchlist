import "package:flutter/material.dart";
import 'package:flutter/services.dart';

import '../../../../core/constants/color/constant_colors.dart';
import '../../../../core/constants/const_padding.dart';
import '../../model/base_model.dart';
import '../../model/movie_db_model.dart';
import 'components/button/save_button.dart';
import 'components/card/plot_card.dart';
import 'components/informatin_poster_stack.dart';
import 'components/view/title_director_genre_view.dart';

// ignore: must_be_immutable
class MovieDetailsView extends StatefulWidget {
  BaseMovieModel? model;

  MovieDetailsView({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<MovieDetailsView> createState() => _MovieDetailsViewState();
}

class _MovieDetailsViewState extends State<MovieDetailsView> {
  Color? color;
  bool isLoading = false;
  List<String>? genres;
  bool? isDb;

  void check() {
    if (widget.model is MovieDbModel) {
      isDb = true;
    } else {
      isDb = false;
    }
  }

  @override
  void initState() {
    check();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    genres = widget.model!.genre!.split(',');
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: backgroundDark,
        child: isLoading
            ? const CircularProgressIndicator()
            : SingleChildScrollView(
                child: Column(children: [
                  InformationAndPosterView(
                    poster: widget.model!.poster!,
                    runtime: widget.model!.runtime!,
                    year: widget.model!.year!,
                    imdbRating: widget.model!.imdbRating!,
                  ),
                  const Padding(padding: padding20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        TitleDirectorGenreView(
                            title: widget.model!.title!,
                            director: widget.model!.director!,
                            genres: genres),
                        const Padding(padding: padding20),
                        PlotCard(text: widget.model!.plot!, size: size),
                        const Padding(padding: padding20),
                        !isDb!
                            ? SaveButton(widget: widget, size: size)
                            : Container(),
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
