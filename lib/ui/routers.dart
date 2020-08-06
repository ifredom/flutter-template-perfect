import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import '../core/constants/constants.dart';
import 'pages/404.dart';
import 'pages/audioplayer/audioplay.dart';
import 'pages/home/home.dart';


// 保持参数与路由的值一致
class RoutesUtils {
  static const String homePage = 'app://';
  static const String adminHomePage = 'app://adminHomePage';

  static const String playViewPage = "app://playview";
  static const String bluelibPage = "app://bluelibPage";
  static const String flutterbluePage = "app://flutterbluePage";
  static const String midiPage = "app://midiPage";
  static const String loginPage = "app://loginPage";
  static const String loginPhonePage = "app://loginPhonePage";
  static const String splashPage = "app://splashPage";
  static const String webViewPage = "app://webViewPage";


  static Route<dynamic> generateRoute(
      BuildContext context, RouteSettings settings) {
    return GetRouteBase(
      settings: RouteSettings(name: settings.name),
      page: _generateView(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget _generateView(RouteSettings settings) {
    
    if (Constants.DEBUG) {
      final _log = Logger('routers');
      _log.warning("跳转路由: ${settings.name}");
    }

    switch (settings.name) {
      // case bluelibPage:
      //   return BluelibPage();
      case flutterbluePage:
        return AudioPlayDemo();
      case homePage:
        return HomePage();
  

      default:
        return WidgetNotFound();
    }
  }

  // Add routes that should behave as fullScreenDialogs
  static final _fullScreenDialogs = [
    // Routes.route_1,
    // Routes.route_2,
  ];
}

/// 使用方式
// locator<NavigationService>().push(FreemodeRouter.freemodeBooklistPage);
