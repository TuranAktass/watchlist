import "package:flutter/material.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart' as env;

import 'features/movie/view/movie_search_view/movie_search_view.dart';

Future main() async {
  await env.dotenv.load(fileName: '.env');
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Watchlist', home: MovieView());
  }
}
