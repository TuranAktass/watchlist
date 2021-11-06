import "package:flutter/material.dart";

import '../../../../../../core/color/constant_colors.dart';

class LeftArrowButton extends StatelessWidget {
  const LeftArrowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: mineShaft.withOpacity(0.4), shape: const CircleBorder()),
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.keyboard_arrow_left_rounded, size: 36),
        ));
  }
}
