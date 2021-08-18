import 'package:feature_discovery/feature_discovery.dart';
import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:fluttertemplate/core/constants/app_theme.dart';
import 'package:fluttertemplate/core/localization/setup_local.dart';
import 'package:fluttertemplate/core/managers/core_manager.dart';
import 'package:fluttertemplate/core/managers/restart_manager.dart';
import 'package:get/get.dart';
import 'package:stacked_services/stacked_services.dart';

class RootComponent extends StatefulWidget {
  @override
  _RootComponentState createState() => _RootComponentState();
}

class _RootComponentState extends State<RootComponent> {
  @override
  Widget build(BuildContext context) {
    return RestartManager(
      child: CoreManager(
        child: FeatureDiscovery(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: localizationsDelegates,
            localeResolutionCallback: loadSupportedLocals,
            supportedLocales: supportedLocales,
            locale: Locale('zh', 'CN'),
            title: 'flutterApp',
            theme: AppTheme.themData,
            navigatorKey: StackedService.navigatorKey,
            navigatorObservers: [CustomNavigatorObserver.routeObserver],
            onGenerateRoute: StackedRouter().onGenerateRoute,
            routingCallback: routingCallback,
          ),
        ),
      ),
    );
  }

  /// 路由监听
  routingCallback(Routing? routing) {
    if (routing!.current == Routes.homeView) {
      // Future.delayed(const Duration(seconds: 2), () async {
      //   Get.snackbar("观察", "You are on second route");
      // });
    }
  }
}

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
