import "package:flutter/material.dart";

import '../../../../../core/constants/const_text_style.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Hey knulphe", style: TextStyles.b1white70(context)),
        const Spacer(),
        const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
            backgroundColor: Colors.white,
            radius: 35),
      ],
    );
  }
}
