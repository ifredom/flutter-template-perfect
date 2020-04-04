import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// 参考项目: https://github.com/shichunlei/flutter_provider_demo
///
///  根组件初始化    Store.of(context); // 初始化context
class Store {
  static BuildContext context;
  static init(BuildContext context) {
    Store.context ??= context;
    return context;
  }

  static mult(
      {BuildContext context, Widget child, List<SingleChildWidget> providers}) {
    Store.context ??= context;
    // 返回多个状态S
    return MultiProvider(providers: providers, child: child);
  }

  // 通过Provider.value<T>(context)获取状态数据.适用于widget不变，value变化得情况
  static T value<T>({BuildContext context, bool listen}) {
    context ??= Store.context;
    print(listen);
    return Provider.of<T>(context, listen: listen ?? true);
  }

  // 通过Consumer监听，获取状态数据
  static Consumer connect<T>(
      {Function(BuildContext context, T value, Widget child) builder,
      Widget child}) {
    Store.context ??= context;
    return Consumer<T>(builder: builder, child: child);
  }
}
