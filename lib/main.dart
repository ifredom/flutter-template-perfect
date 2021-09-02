import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/app/locator.dart';
import 'package:fluttertemplate/ui/views/error_page.dart';

import './core/Constants/Constants.dart';
import 'ui/views/root_component.dart';

void main() async {
  // 应用初始化
  WidgetsFlutterBinding.ensureInitialized();
  await runZonedGuarded<Future<void>>(() async {
    // 报错时，仅仅抛出异常
    ErrorWidget.builder = (FlutterErrorDetails details) {
      if (Constants.DEBUG) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception, details.stack as StackTrace);
      }

      return ErrorPage(details);
    };

    /// 启动GetIt定位服务
    await setupLocator();

    /// 根Widget
    runApp(RootComponent());
  }, (Object error, StackTrace stackTrace) async {
    // Zone中未捕获异常处理回调
    await _reportError(error, stackTrace);
  });
}

// 上传应用异常信息到服务器！
Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  if (Constants.DEBUG) {
    print('开发模式, 不发送异常到服务端. $stackTrace');
    return;
  }
  print('发送异常信息到服务器 ...');
}
