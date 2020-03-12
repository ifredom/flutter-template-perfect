import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'application.dart';
import 'routers.dart';

/// fluro的路由跳转工具类
class NavigatorUtils {
  TransitionType transitionType = TransitionType.native;

  //不需要页面返回值的跳转
  static push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: TransitionType.native);
  }

  //需要传参数的跳转
  static pushProp(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Map<String, dynamic> queryParameters}) {
    FocusScope.of(context).unfocus();
    Navigator.of(context).pushNamed(path, arguments: queryParameters);
  }

  //需要页面返回值的跳转
  static pushResult(
      BuildContext context, String path, Function(Object) function,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus();
    Application.router
        .navigateTo(context, path,
            replace: replace,
            clearStack: clearStack,
            transition: TransitionType.native)
        .then((result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print("$error");
    });
  }

  /// 返回
  static void goBack(BuildContext context, {dynamic options}) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, options);
  }

  /// 带参数返回
  static void goBackWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }

  static goWebViewPage(BuildContext context, String title, String url) {
    //fluro 不支持传中文,需转换
    push(context,
        '${RoutesUtils.webViewPage}?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}');
  }

  ///Page页面的容器，做一次通用自定义
  static Widget pageContainer(widget) {
    return MediaQuery(
      ///不受系统字体缩放影响
      data: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
          .copyWith(textScaleFactor: 1),
      child: widget,
    );
  }
}
