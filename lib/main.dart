import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/ui/root/root_component.dart';
import 'core/utils/common/logger.dart';
import 'locator.dart';

void main() async {
  // 初始化 访问二进制文件/初始化插件
  WidgetsFlutterBinding.ensureInitialized();

  setupLogger();
  await setupLocator();

  // 设置全屏
  SystemChrome.setEnabledSystemUIOverlays([]);

  // 强制横屏
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) {
    runApp(RootComponent());
    if (Platform.isAndroid) {
      //设置Android头部的导航栏透明
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  });
}
