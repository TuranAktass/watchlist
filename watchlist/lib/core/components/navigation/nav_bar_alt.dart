import "package:flutter/material.dart";
import 'package:watchlist/core/init/navigation/i_navigation_service.dart';
import 'package:watchlist/core/init/navigation/navigation_route.dart';
import 'package:watchlist/core/init/navigation/navigation_service.dart';
import 'package:watchlist/features/movie/view/home_view/home_view.dart';
import 'package:watchlist/features/movie/view/movie_db_list_view/movie_db_list_view.dart';
import 'package:watchlist/features/movie/view/movie_search_view/movie_search_view.dart';

class AltNavBar extends StatefulWidget {
  const AltNavBar({Key? key, required this.routeIndex}) : super(key: key);
  final int routeIndex;

  @override
  _AltNavBarState createState() => _AltNavBarState();
}

class _AltNavBarState extends State<AltNavBar> {
  final INavigationService _navigationService = NavigationService.instance;
  final NavigationRoute _routes = NavigationRoute.instance;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.routeIndex;
  }

  Map<String, Widget> map = {
    '/home': const HomeView(),
    '/search': MovieSearchView(),
    '/list': MovieDbListView(),
  };

  onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });

    _navigationService.navigateTo(
        path: map.keys.toList()[index],
        object: _routes
            .onGenerateRoute(RouteSettings(name: map.keys.toList()[index])));
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.black,
      currentIndex: _currentIndex,
      selectedIconTheme: const IconThemeData(size: 36),
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      onTap: onItemSelected,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          label: 'List',
        ),
      ],
    );
  }
}
