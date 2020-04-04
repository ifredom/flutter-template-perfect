import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show GlobalKey, NavigatorState;

/// Service that is responsible for navigating around the app
abstract class NavigationService {
  GlobalKey<NavigatorState> get navigatorKey;
  BuildContext get navigatorContext;

  Future<dynamic> push(String routeName, {Object arguments});

  Future<dynamic> pushReplacementNamed(String routeName, {Object arguments});

  Future<dynamic> popAllAndPushNamed(String routeName, {Object arguments});

  void pop({dynamic returnValue});
}
