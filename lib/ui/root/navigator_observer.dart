import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// 路由监听
// 使用: navigatorObservers: <NavigatorObserver>[CustomNavigatorObserver()],
class CustomNavigatorObserver extends NavigatorObserver {
  static CustomNavigatorObserver _instance = CustomNavigatorObserver();
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  static CustomNavigatorObserver getInstance() => _instance;

  static observer({Routing? routing}) {
    print(_instance);
  }

  // https://juejin.im/post/6844903798398255111
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if ((previousRoute is TransitionRoute) && previousRoute.opaque) {
      //全屏不透明，通常是一个page
      print("监控到");
    } else {
      //全屏透明，通常是一个弹窗
    }
  }
}

// Get 路由监听
// 使用: navigatorObservers: [GetObserver(MiddleWare.observer)],
class MiddleWare {
  static observer(Routing routing) {
    if (routing.current == 'app://homeworkIndexPage') {
      print('监控到 app://homeworkIndexPage 页面');
    }
  }
}
