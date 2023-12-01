import 'package:flutter/material.dart';
import 'package:jumush_tapp/product/navigation/navigate_routes.dart';

class NavigatorManager {
  NavigatorManager._();
  static NavigatorManager instance = NavigatorManager._();
  GlobalKey<NavigatorState> get navigatorGlobalKey => _navigatorGlobalKey;

  final GlobalKey<NavigatorState> _navigatorGlobalKey = GlobalKey();
  void pushToPage(NavigateRoutes routes, {Object? arguments}) {
    _navigatorGlobalKey.currentState?.pushNamed(
      routes.withParaf,
      arguments: arguments,
    );
  }

  void pushTopageReplacementNamed(NavigateRoutes routes, {Object? arguments}) {
    _navigatorGlobalKey.currentState
        ?.pushReplacementNamed(routes.withParaf, arguments: arguments);
  }

  void pushNamedAndRemoveUntil(NavigateRoutes routes, {Object? arguments}) {
    _navigatorGlobalKey.currentState?.pushNamedAndRemoveUntil(
      routes.withParaf,
      arguments: arguments,
      (route) => false,
    );
  }
}
