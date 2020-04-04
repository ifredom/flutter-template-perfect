import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:template/ui/pages/404.dart';
import 'package:template/ui/pages/audioplayer/audioplay.dart';
import 'package:template/ui/pages/home/home.dart';
import 'package:template/ui/pages/user/login.dart';
import 'package:template/ui/pages/user/login_phone.dart';
import 'package:template/ui/pages/webview/browser.dart';

/// 路由跳转使用方式
// locator<NavigationService>().push(RoutesUtils.homePage);

class RoutesUtils {
  static Router router;
  static const String homePage = 'app://';
  static const String teacherHomePage = 'app://teacherHomePage';
  static const String webViewPage = "app://webview";
  static const String audioPlayDemoPage = "app://audioPlayDemo";

  static const String formPasswordPage = "app://formPasswordPage";
  static const String formAlipayPage = "app://formAlipayPage";

  static const String formWithdrawalPage = "app://formWithdrawalPage";
  static const String formWithdrawalSucessPage =
      "app://formWithdrawalSucessPage";
  static const String formRenewalPage = "app://formRenewalPage";
  static const String loginPage = "app://loginPage";
  static const String loginPhonePage = "app://loginPhonePage";

  static const String activesIntroPage = "app://activesIntroPage";
  static const String playMusicPage = "app://playMusicPage";

  static const String freemodePage = "app://freemodePage";
  static const String freemodeBooklistPage = "app://freemodeBooklistPage";

  static const String homeworkIndexPage = "app://homeworkIndexPage";
  static const String homeworkDetailPage = "app://homeworkDetailPage";

  static const String completematerialPage =
      "app://completematerialPage"; // 选择角色
  static const String joinOrchestraPage = "app://joinOrchestraPage"; // 加入乐团
  static const String perfectInformationPage =
      "app://perfectInformationPage"; // 完善资料
  static const String inviteStudentPage = "app://inviteStudentPage"; // 邀请学院

  static Route<dynamic> generateRoute(
    BuildContext context,
    RouteSettings settings,
  ) {
    return platformPageRoute(
      context: context,
      settings: RouteSettings(name: settings.name),
      builder: (context) => _generateView(settings),
      fullscreenDialog: _fullScreenDialogs.contains(settings.name),
    );
  }

  static Widget _generateView(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return HomePage();
      case webViewPage:
        print(settings.arguments);
        return Browser();
      case audioPlayDemoPage:
        return AudioPlayDemo();

      case loginPage:
        return LoginPage();
      case loginPhonePage:
        return LoginPhonePage();

      // case freemodeBooklistPage:
      //   final Teachingbook post = settings.arguments as Teachingbook;
      //   return FreeModeBooklist(book: post);

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
