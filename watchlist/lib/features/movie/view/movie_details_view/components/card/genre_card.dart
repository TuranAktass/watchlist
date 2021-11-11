import "package:flutter/material.dart";
import '../../../../../../core/constants/color/constant_colors.dart';

import 'package:watchlist/core/constants/const_text_style.dart';

class GenreCard extends StatelessWidget {
  final String text;
  const GenreCard({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      margin: const EdgeInsets.all(4.0),
      color: mineShaft.withOpacity(0.2),
      child: SizedBox(
          width: 100,
          height: 40,
          child:
              Center(child: Text(text, style: TextStyles.b1white38(context)))),
    );
  }
}
