import 'dart:async';

import 'package:flutter/material.dart';

import 'key/NoKey.dart';

void main() async {
  // 应用初始化
  WidgetsFlutterBinding.ensureInitialized();
  await runZonedGuarded<Future<void>>(() async {
    // 强制横屏
    runApp(NoKeyWidget());
  }, (Object error, StackTrace stackTrace) async {});
}
