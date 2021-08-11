import 'package:fluter_template_perfect/ui/views/404.dart';
import 'package:fluter_template_perfect/ui/views/home/home_view/home.dart';
import 'package:fluter_template_perfect/ui/views/login/login_phone_view.dart';
import 'package:fluter_template_perfect/ui/views/login/login_view.dart';
import 'package:fluter_template_perfect/ui/views/product_detail/product_detail_view.dart';
import 'package:fluter_template_perfect/ui/views/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 路由跳转使用方式
// locator<NavigationService>().push(ViewRoutes.homePage);
class ViewRoutes {
  static const String homeView = 'app://';
  static const String loginView = "app://login";
  static const String loginPhoneView = "app://loginPhone";
  static const String registerView = "app://register";
  static const String productDetailView = "app://productDetail";

  static Route<dynamic> generateRoute(BuildContext context, RouteSettings settings) {
    return GetPageRoute(
      settings: RouteSettings(name: settings.name),
      page: () => _generateView(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget _generateView(RouteSettings settings) {
    switch (settings.name) {
      case homeView:
        return HomeView();

      case loginView:
        return LoginView();

      case loginPhoneView:
        return LoginPhoneView();
      case registerView:
        return RegisterView();

      case productDetailView:
        // 路由传递参数
        final Map post = settings.arguments as Map;
        return ProductDetailView(post);

      default:
        return WidgetNotFound();
    }
  }

  // Add routes that should behave as fullScreenDialogs
  static final _fullScreenDialogs = [
    // Routes.route_1,
    // Routes.route_2,
  ];

  // 路由监听
  static routingCallback(Routing? routing) {
    if (routing!.current == ViewRoutes.homeView) {
      print("watch route event，navigatorTo homeview");
      Get.snackbar("观察", "You are on second route");
    }
  }
}
