import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertemplate/ui/views/error_page.dart';

import './core/Constants/Constants.dart';
import 'core/app/app.locator.dart';
import 'ui/views/root_component.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // View the that need to be redrawn Widget(查看需要重绘的widget)
  // debugProfileBuildsEnabled = true;

  await runZonedGuarded<Future<void>>(() async {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      if (Constants.DEBUG) {
        FlutterError.dumpErrorToConsole(details);
      } else {
        Zone.current.handleUncaughtError(details.exception, details.stack as StackTrace);
      }
      return ErrorPage(details);
    };

    /// Start getit location service(启动GetIt定位服务)
    await setupLocator();

    // Set full screen (设置全屏)
    await SystemChrome.setEnabledSystemUIOverlays([
      // SystemUiOverlay.top,
      // SystemUiOverlay.bottom,
    ]);

    /// root Widget
    runApp(RootComponent());
  }, (Object error, StackTrace stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

// Upload application exception information to the server!(上传应用异常信息到日志服务器！)
Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  if (Constants.DEBUG) {
    print('Development mode, do not send exceptions to the server. $stackTrace');
    return;
  }
  print('Send exception information to the server ...');
}
