import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/ui/root/root_component.dart';

import 'ui/pages/error_page.dart';

void main() {
  // 参考 https://github.com/xinsui01/github-app-flutter
  runZoned(() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack);
      return ErrorPage(details);
    };
    SystemChrome.setPreferredOrientations(
            [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
        .then((_) {
      runApp(RootComponent());
    });
  }, onError: (Object obj, StackTrace stack) {
    // Zone中未捕获异常处理回调
    // print(obj);
    // print(stack);
  });
}
