import "package:flutter/material.dart";
import '../../../../../../core/constants/color/constant_colors.dart';

class TextStyles {
  static h6white38(BuildContext context) =>
      Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white);

  static b1white38(BuildContext context) => Theme.of(context)
      .textTheme
      .bodyText1!
      .copyWith(color: white38, fontSize: 16, fontWeight: FontWeight.w400);

  static label(BuildContext context) => Theme.of(context)
      .textTheme
      .bodyText1!
      .copyWith(color: white38, fontSize: 24, fontWeight: FontWeight.w400);

  static h6white60(BuildContext context) => Theme.of(context)
      .textTheme
      .headline6!
      .copyWith(color: Colors.white60, fontWeight: FontWeight.w400);

  static h5white(BuildContext context) => Theme.of(context)
      .textTheme
      .headline5!
      .copyWith(color: Colors.white, fontWeight: FontWeight.w400);

  static h6white70(BuildContext context) => Theme.of(context)
      .textTheme
      .headline4!
      .copyWith(color: Colors.white70, fontWeight: FontWeight.w500);
  static b1white70(BuildContext context) =>
      Theme.of(context).textTheme.bodyText1!.copyWith(
            color: Colors.white70,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          );
}
