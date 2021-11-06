import "package:flutter/material.dart";
import 'package:watchlist/core/constants/const_text_style.dart';

class PlotCard extends StatelessWidget {
  const PlotCard({Key? key, required this.size, required this.text})
      : super(key: key);

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Plot",
            style: TextStyles.label(context),
            textAlign: TextAlign.left,
          ),
        ),
        Row(
          children: [
            SizedBox(
                width: size.width / 1.7,
                child: Text(
                  text,
                  style: TextStyles.b1white38(context),
                )),
          ],
        ),
      ],
    );
  }
}
