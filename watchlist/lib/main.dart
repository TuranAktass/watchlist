import "package:flutter/material.dart";
import 'package:flutter_dotenv/flutter_dotenv.dart' as env;

import 'core/init/navigation/navigation_route.dart';
import 'core/init/navigation/navigation_service.dart';
import 'features/movie/view/home_view/home_view.dart';

Future main() async {
  await env.dotenv.load(fileName: '.env');
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Watchlist',
      home: const HomeView(),
      navigatorKey: NavigationService.instance.navigationKey,
      onGenerateRoute: NavigationRoute.instance.onGenerateRoute,
    );
  }
}
