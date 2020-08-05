import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:template/core/constants/app_theme.dart';
import 'package:template/core/managers/core_manager.dart';
import 'package:template/core/managers/restart_manager.dart';
import 'package:template/core/routes/routers.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/locator.dart';
import 'package:template/provider_setup.dart';
import 'package:template/ui/root/start_up_view.dart';


class RootComponent extends StatefulWidget {
  @override
  _RootComponentState createState() => _RootComponentState();
}

class _RootComponentState extends State<RootComponent> {
  final navigationService = locator<NavigationService>();
  @override
  Widget build(BuildContext context) {
    return RestartManager(
      child: MultiProvider(
        providers: providers,
        child: CoreManager(
          child: OKToast(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              // localizationsDelegates: localizationsDelegates,
              // supportedLocales: supportedLocales,
              // localeResolutionCallback: loadSupportedLocals,
              title: 'flutterApp',
              theme: AppTheme.themData,
              navigatorKey: navigationService.navigatorKey,
              navigatorObservers: [CustomNavigatorObserver.routeObserver],
              onGenerateRoute: (settings) => ViewRoutes.generateRoute(context, settings),
              home: StartUpView(),
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
  static CustomNavigatorObserver _instance;
  static final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  static CustomNavigatorObserver getInstance() {
    if (_instance == null) {
      _instance = CustomNavigatorObserver();
    }
    return _instance;
  }

  static observer({Routing routing}) {
    print(_instance);
  }

  // https://juejin.im/post/6844903798398255111
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if ((previousRoute is TransitionRoute) && previousRoute.opaque) {
      //全屏不透明，通常是一个page
      print("监控到");
    } else {
      //全屏透明，通常是一个弹窗
    }
  }
}

// Get 路由监听，第二个
// 使用: navigatorObservers: [GetObserver(MiddleWare.observer)],
class MiddleWare {
  static observer(Routing routing) {
    if (routing.current == 'app://homeworkIndexPage') {
      print('监控到 app://homeworkIndexPage 页面');
    }
  }
}
