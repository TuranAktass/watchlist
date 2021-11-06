import "package:flutter/material.dart";
import 'package:watchlist/core/constants/const_text_style.dart';

class InformationCard extends StatelessWidget {
  const InformationCard({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: -1,
        child: Card(
            elevation: 0,
            color: Colors.transparent,
            child: Row(
              children: [
                Icon(icon, color: Colors.white38),
                const Padding(padding: EdgeInsets.all(4.0)),
                Text(text, style: TextStyles.h6white60(context)),
              ],
            )));
  }
}
