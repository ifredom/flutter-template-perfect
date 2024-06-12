import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertemplate/ui/views/error_page.dart';

import './core/Constants/Constants.dart';
import 'core/app/app.locator.dart';
import 'ui/views/root_component.dart';

void main() async {
  BindingBase.debugZoneErrorsAreFatal = true;

  // View the that need to be redrawn Widget(查看需要重绘的widget)
  // debugProfileBuildsEnabled = true;

  // If we run on web, do not use Crashlytics (not supported on web yet)
  if (kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();

    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.dumpErrorToConsole(details);
    };
    runApp(const RootComponent(web: true));
  } else {
    // Use dart zone to define Crashlytics as error handler for errors
    runZonedGuarded<Future<void>>(() async {
      WidgetsFlutterBinding.ensureInitialized();

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
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
        // SystemUiOverlay.top,
        // SystemUiOverlay.bottom,
      ]);

      /// root Widget
      runApp(const RootComponent());
    }, (error, stack) => _reportError(error, stack));
  }
}

// Upload application exception information to the server!(上传应用异常信息到日志服务器！)
Future<Null> _reportError(dynamic error, dynamic stackTrace) async {
  if (Constants.DEBUG) {
    print('Development mode, do not send exceptions to the server. $stackTrace');
    return;
  }
  print('Send exception information to the server ...');
}
