import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/config.dart';
import 'model/user.dart';

/// 参考项目: https://github.com/shichunlei/flutter_provider_demo
class Store {
  static BuildContext context;
  static BuildContext widgetCtx;

  //  初始化
  static init({BuildContext context, child}) {
    /// 返回多个状态S
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => ConfigModel()),
      ChangeNotifierProvider(create: (_) => UserModel()),
    ], child: child);
  }

  //  通过Provider.value<T>(context)获取状态数据
  static T value<T>(BuildContext context, {bool listen = true}) {
    return Provider.of(context, listen: listen);
  }

  //  通过Consumer获取状态数据
  static Consumer connect<T>(
      {Function(BuildContext context, T value, Widget child) builder,
      Widget child}) {
    return Consumer<T>(builder: builder, child: child);
  }
}
