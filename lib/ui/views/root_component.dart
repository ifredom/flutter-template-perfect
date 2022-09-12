import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:fluttertemplate/core/constants/app_theme.dart';
import 'package:fluttertemplate/core/localization/setup_local.dart';
import 'package:fluttertemplate/core/managers/lifecycle_manager.dart';
import 'package:fluttertemplate/core/managers/restart_manager.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:stacked_services/stacked_services.dart';

class RootComponent extends StatefulWidget {
  @override
  _RootComponentState createState() => _RootComponentState();
}

class _RootComponentState extends State<RootComponent> {
  @override
  Widget build(BuildContext context) {
    return RestartManager(
      child: LifeCycleManager(
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: localizationsDelegates,
          localeResolutionCallback: loadSupportedLocals,
          supportedLocales: supportedLocales,
          locale: Locale('zh', 'CN'),
          title: 'flutterApp',
          theme: AppTheme.themData,
          navigatorKey: StackedService.navigatorKey,
          navigatorObservers: [StackedService.routeObserver],
          onGenerateRoute: StackedRouter().onGenerateRoute,
          routingCallback: routingCallback,
        ),
      ),
    );
  }

  routingCallback(Routing? routing) {
    if (routing!.current == Routes.homeView) {
      // Future.delayed(const Duration(seconds: 2), () async {
      //   Get.snackbar("Tips", "You are on homeView route");
      // });
    }
  }
}
