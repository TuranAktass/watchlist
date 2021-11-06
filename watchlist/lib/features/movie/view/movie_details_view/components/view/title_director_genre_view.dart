import "package:flutter/material.dart";

import '../../../../../../core/constants/const_padding.dart';
import '../../../../../../core/constants/const_text_style.dart';
import '../card/genre_card.dart';

class TitleDirectorGenreView extends StatelessWidget {
  const TitleDirectorGenreView({
    Key? key,
    required this.title,
    required this.director,
    required this.genres,
  }) : super(key: key);

  final String title;
  final String director;
  final List<String>? genres;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyles.h6white70(context)),
        Text(director, style: TextStyles.h6white60(context)),
        const Padding(padding: EdgeInsets.all(10)),
        Row(
          children: [
            GenreCard(text: genres![0]),
            GenreCard(text: genres![1]),
          ],
        ),
      ],
    );
  }
}
