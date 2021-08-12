import 'dart:async';
import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/core/setup/setup_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './core/Constants/Constants.dart';
import 'ui/views/root_component.dart';
import 'ui/views/error_page.dart';

void main() async {
  // 应用初始化
  WidgetsFlutterBinding.ensureInitialized();

  await runZonedGuarded<Future<void>>(() async {
    // 程序异常时，不退出应用，仅仅捕捉异常信息并在控制台打印。
    ErrorWidget.builder = (FlutterErrorDetails details) {
      if (Constants.DEBUG) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception, details.stack as StackTrace);
      }
      return ErrorPage(details);
    };

    // 启动日志
    setupLogger();

    /// 启动GetIt定位服务
    await setupLocator();

    // 设置全屏
    await SystemChrome.setEnabledSystemUIOverlays([]);

    // 强制横屏
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
