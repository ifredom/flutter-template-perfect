import 'package:feature_discovery/feature_discovery.dart';
import 'package:feedback/feedback.dart';
import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:fluttertemplate/core/constants/app_theme.dart';
import 'package:fluttertemplate/core/managers/core_manager.dart';
import 'package:fluttertemplate/core/managers/restart_manager.dart';

import 'package:fluttertemplate/core/setup/setup_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked_services/stacked_services.dart';

import 'start_up/start_up_view.dart';

class RootComponent extends StatefulWidget {
  @override
  _RootComponentState createState() => _RootComponentState();
}

class _RootComponentState extends State<RootComponent> {
  @override
  Widget build(BuildContext context) {
    return RestartManager(
      child: CoreManager(
        child: OKToast(
          child: BetterFeedback(
            child: FeatureDiscovery(
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: localizationsDelegates,
                supportedLocales: supportedLocales,
                localeResolutionCallback: loadSupportedLocals,
                locale: Locale('zh'),
                title: 'flutterApp',
                theme: AppTheme.themData,
                navigatorKey: StackedService.navigatorKey,
                navigatorObservers: [CustomNavigatorObserver.routeObserver],
                onGenerateRoute: StackedRouter().onGenerateRoute,
                home: StartUpView(),
                routingCallback: (Routing? routing) {
                  if (routing!.current == Routes.homeView) {
                    print("watch route event，navigatorTo homeview");
                    Get.snackbar("观察", "You are on second route");
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
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
