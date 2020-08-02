import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/app/provider_setup.dart';

import '../../core/constants/app_theme.dart';
import '../../core/managers/core_manager.dart';
import '../../core/managers/restart_manager.dart';
import '../../core/services/navigation/navigation_service.dart';
import '../routers.dart';
import 'navigator_observer.dart';
import 'start_up_view.dart';

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
              title: 'perfect-app',
              theme: AppTheme.themData,
              navigatorKey: navigationService.navigatorKey,
              navigatorObservers: [CustomNavigatorObserver.routeObserver],
              onGenerateRoute: (settings) => RoutesUtils.generateRoute(context, settings),
              home: StartUpView(),
            ),
          ),
        ),
      ),
    );
  }
}
