import "package:flutter/material.dart";

import 'poster_view.dart';
import 'rotated_info_bar.dart';

class InformationAndPosterView extends StatelessWidget {
  const InformationAndPosterView(
      {Key? key,
      required this.poster,
      required this.year,
      required this.runtime,
      required this.imdbRating})
      : super(key: key);

  final String poster;
  final String year;
  final String runtime;
  final String imdbRating;

  String formatRunTime(String minutes) {
    var arr = minutes.split('min');
    int minute = int.parse(arr[0]);
    int hour = 0;

    do {
      minute = minute - 60;
      hour = hour + 1;
    } while (minute >= 60);

    return '${hour}h ${minute}m';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: PosterView(poster: poster),
        ),
        Positioned(
          left: 10,
          child: RotatedInformationBar(
              yearInfo: year,
              runTimeInfo: formatRunTime(runtime),
              imdbRatingInfo: imdbRating),
        ),
      ],
    );
  }
}
