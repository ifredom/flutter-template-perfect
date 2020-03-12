import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:chinaculture/pages/home/home.dart';
import 'router_init.dart';
import '404.dart';
import 'package:chinaculture/routers/modules/homework_route.dart';

class RoutesUtils {
  static Router router;
  static const String defaultRouteName = '/';
  static const String homePage = '/home';
  static const String webViewPage = "/webview";
  static const String audioPlayDemoPage = "/audioPlayDemo";

  //子router管理集合
  static List<IRouterProvider> _listRouter = [];

  static void configureRoutes(Router router) {
    /// 404页面，没有找到路由的回调方法
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      debugPrint("未找到目标页");
      return WidgetNotFound();
    });

    // 主界面可以在此类中进行注册（可定义传参）
    router.define(homePage,
        handler: Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    HomePage()));

    // 参考：https://www.jianshu.com/p/1987cc9b714a
    // 每次初始化前 先清除集合 以免重复添加
    _listRouter.clear();

    /// 各个模块得路由，统一在此添加初始化
    _listRouter.add(HomeworkRouter());

    /// 初始化路由 循环遍历取出每个子router进行初始化操作
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });

    RoutesUtils.router = router;
  }
}

/// 使用方式

// 不需要穿参数的
// NavigatorUtils.push(context, LoginRouter.loginPage, replace: true);

// 需要穿参数的
// NavigatorUtils.push(context,
// '${Routes.webViewPage}?param1=${Uri.encodeComponent(content1)}&param2=${Uri.encodeComponent(content2)}' , replace: true);

//传参数的
// NavigatorUtils.pushProp(context, AdmallRouter.adplyainfopage,queryParameters:{"key":"123123"});
//接收参数
// ModalRoute.of(context).settings.arguments;

// 有返回值跳转
// NavigatorUtils.pushResult(context, AccountRouter.citySelectPage, (result){
//   setState(() {
//      //result是返回的结果
//      TestModel model = result;
//      _name = model.name;
//   });
// });

// 返回上一级
// NavigatorUtils.goBack(context);

// 带参数返回上一级(result是返回结果)
// NavigatorUtils.goBackWithParams(context, result);
