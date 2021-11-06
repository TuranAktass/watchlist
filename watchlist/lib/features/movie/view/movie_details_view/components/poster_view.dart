import "package:flutter/material.dart";

class PosterView extends StatelessWidget {
  const PosterView({
    Key? key,
    required this.poster,
  }) : super(key: key);

  final String poster;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        poster,
        semanticLabel: 'Title',
      ),
    );
  }
}
