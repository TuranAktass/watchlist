import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'i_navigation_service.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instance = NavigationService._init();
  static NavigationService get instance => _instance;

  NavigationService._init();

  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  // ignore: prefer_function_declarations_over_variables
  final removeAllOldRoutes = (Route<dynamic> route) {
    return false;
  };

  @override
  Future<void> navigateTo({String? path, Object? object}) async {
    await navigationKey.currentState!.pushNamed(path!, arguments: object!);
  }

  @override
  Future<void> navigateToClear({String? path, Object? object}) async {
    await navigationKey.currentState!
        .pushNamedAndRemoveUntil(path!, removeAllOldRoutes, arguments: object!);
  }

  @override
  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
