import "package:flutter/material.dart";
import 'package:watchlist/features/movie/view/movie_db_list_view/movie_db_list_view.dart';

import '../../../../../core/constants/const_text_style.dart';

class TextWithIconButton extends StatelessWidget {
  const TextWithIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 36, 0, 0),
        child: Row(
          children: [
            Text('Recently Watched', style: TextStyles.b1white70(context)),
            const Spacer(),
            IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MovieDbListView())),
              icon: const Icon(
                Icons.more_horiz,
                color: Colors.white70,
                size: 36,
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
