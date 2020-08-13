import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template/ui/pages/404.dart';
import 'package:template/ui/pages/home/home_view/home.dart';
import 'package:template/ui/pages/login/login_view.dart';
import 'package:template/ui/pages/login/login_phone_view.dart';

/// 路由跳转使用方式
// locator<NavigationService>().push(ViewRoutes.homePage);

class ViewRoutes {
  static const String homePage = 'app://';
  static const String adminHomePage = 'app://adminHomePage';
  static const String loginPage = "app://loginPage";
  static const String loginPhonePage = "app://loginPhonePage";

  static Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    return GetPageRoute(
      settings: RouteSettings(name: settings.name),
      page: () => _generateView(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget _generateView(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        // final post = settings.arguments;
        return HomePage();

      case loginPage:
        return LoginPage();

      case loginPhonePage:
        return LoginPhonePage();

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
