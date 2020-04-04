import 'package:flutter/material.dart';
import 'package:template/core/constants/app_theme.dart';
import 'package:template/core/services/snackbar/snack_bar_service.dart';
import 'package:template/ui/root/start_up_view.dart';
import 'package:template/locator.dart';
import 'package:provider/provider.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:template/provider_setup.dart';
import 'package:template/core/managers/core_manager.dart';
import 'package:template/core/managers/dialog_manager.dart';
import 'package:template/core/managers/restart_manager.dart';
import 'package:template/core/managers/snack_bar_manager.dart';
import 'package:template/core/routes/routers.dart';
import 'package:template/core/services/dialog/dialog_service.dart';
import 'package:template/core/services/navigation/navigation_service.dart';

class RootComponent extends StatefulWidget {
  @override
  _RootComponentState createState() => _RootComponentState();
}

class _RootComponentState extends State<RootComponent> {
  @override
  Widget build(BuildContext context) {
    return RestartManager(
      child: CoreManager(
        child: MultiProvider(
          providers: providers,
          child: OKToast(
            child: MaterialApp(
              // localizationsDelegates: localizationsDelegates,
              // supportedLocales: supportedLocales,
              // localeResolutionCallback: loadSupportedLocals,
              title: '享弹',
              theme: AppTheme.themData,
              debugShowCheckedModeBanner: false,
              navigatorKey: locator<NavigationService>().navigatorKey,
              onGenerateRoute: (settings) =>
                  RoutesUtils.generateRoute(context, settings),
              builder: _setupDialogManager,
              home: StartUpView(),
            ),
          ),
        ),
      ),
    );
  }

  /// MaterialApp提供了Builder函数，通过设置Key。
  // 可以定义自定的导航，来控制关闭/显示警报。
  Widget _setupDialogManager(context, widget) {
    return Navigator(
      key: locator<DialogService>().dialogNavigationKey,
      onGenerateRoute: (settings) => platformPageRoute(
        context: context,
        builder: (context) => DialogManager(
          child: Navigator(
            key: locator<SnackBarService>().snackBarNavigationKey,
            onGenerateRoute: (settings) => platformPageRoute(
              context: context,
              builder: (context) => SnackBarManager(
                child: widget,
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
  static CustomNavigatorObserver _instance;

  static CustomNavigatorObserver getInstance() {
    if (_instance == null) {
      _instance = CustomNavigatorObserver();
    }
    return _instance;
  }
}
