import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'routers.dart';

/// fluro的路由跳转工具类
class NavigatorUtils {
  TransitionType transitionType = TransitionType.native;

  //不需要页面返回值的跳转
  static push(BuildContext context, String path,
      {bool replace = false, bool clearStack = false}) {
    FocusScope.of(context).unfocus(); // 确保键盘关闭，防止页面部件溢出
    RoutesUtils.router.navigateTo(context, path,
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
    RoutesUtils.router
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

  /// 跳到指定页面，删除所有路由
  static void goWithRemoveUntil(BuildContext context, String path,
      {bool predicate}) {
    FocusScope.of(context).unfocus();
    Navigator.pushNamedAndRemoveUntil(
        context, path, (Route<dynamic> route) => predicate ?? false);
  }
}
