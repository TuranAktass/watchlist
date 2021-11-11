import 'package:flutter/material.dart';

abstract class INavigationService {
  Future<void> navigateTo({String? path, Object? object});
  Future<void> navigateToClear({String? path, Object? object});
  MaterialPageRoute normalNavigate(Widget widget);
}
