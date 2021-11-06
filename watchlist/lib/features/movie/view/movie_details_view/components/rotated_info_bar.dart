import "package:flutter/material.dart";

import 'button/left_arrow_button.dart';
import 'card/rotated_info_card.dart';

class RotatedInformationBar extends StatelessWidget {
  const RotatedInformationBar(
      {Key? key,
      required this.yearInfo,
      required this.runTimeInfo,
      required this.imdbRatingInfo})
      : super(key: key);

  final String yearInfo;
  final String runTimeInfo;
  final String imdbRatingInfo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const LeftArrowButton(),
        const SizedBox(height: 40),
        InformationCard(
          text: yearInfo,
          icon: Icons.date_range_outlined,
        ),
        const SizedBox(height: 40),
        InformationCard(text: runTimeInfo, icon: Icons.timelapse_outlined),
        const SizedBox(height: 40),
        InformationCard(
            text: imdbRatingInfo, icon: Icons.star_outline_outlined),
      ],
    );
  }
}
