import 'package:flutter/widgets.dart' show GlobalKey, NavigatorState;
import 'navigation_service.dart';
import 'package:flutter/material.dart';

// 使用无context导航， 会导致问题
class NavigationServiceImpl implements NavigationService {
  final _navigatorKey = GlobalKey<NavigatorState>();
  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  BuildContext get navigatorContext => _navigatorKey.currentState.context;

  @override
  Future<dynamic> push(String routeName, {Object arguments}) {
    FocusScope.of(navigatorContext).unfocus(); // 确保键盘关闭，防止页面部件溢出
    return navigatorKey.currentState.pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> pushReplacementNamed(String routeName, {Object arguments}) {
    FocusScope.of(navigatorContext).unfocus(); // 确保键盘关闭，防止页面部件溢出
    return navigatorKey.currentState.pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  @override
  Future<dynamic> popAllAndPushNamed(
    String routeName, {
    Object arguments,
  }) {
    FocusScope.of(navigatorContext).unfocus(); // 确保键盘关闭，防止页面部件溢出
    return navigatorKey.currentState.pushNamedAndRemoveUntil(
      routeName,
      (_) => false,
      arguments: arguments,
    );
  }

  @override
  void pop({returnValue}) {
    FocusScope.of(navigatorContext).unfocus(); // 确保键盘关闭，防止页面部件溢出
    navigatorKey.currentState.pop(returnValue);
  }
}
