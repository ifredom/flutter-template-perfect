import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

import 'TipsScaleAnimated.dart';

/// 二次返回退出APP组件
class DoubleBackExitApp extends StatefulWidget {
  /// 提示文字
  final String title;

  /// 退出提示动画组件
  const DoubleBackExitApp({super.key, this.title = '再按一次退出'});

  @override
  DoubleBackExitAppState createState() => DoubleBackExitAppState();
}

class DoubleBackExitAppState extends State<DoubleBackExitApp> with SingleTickerProviderStateMixin {
  late Animation<double> animation; // 动画对象
  late AnimationController controller;
  late DateTime _lastPressedAt; // 上次点击时间
  late Timer _tipsTimer;

  @override
  void initState() {
    super.initState();
    // 动画对象
    controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    // 定义开始到结束的值
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
  }

  @override
  void dispose() {
    _tipsTimer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      //  listen to the back event  监听返回事件
      canPop: handleWillPop(),
      child: TipsScaleAnimated(
        animation: animation,
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white.withOpacity(0.8),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  // validates if the user wants to exit the app  in 2 seconds  验证用户是否要退出APP，默认2秒
  bool handleWillPop() {
    if (DateTime.now().difference(_lastPressedAt) > const Duration(seconds: 2)) {
      //两次点击间隔超过2秒则重新计时
      _lastPressedAt = DateTime.now();
      runTips();
      return false;
    }
    return exit(0);
  }

  // 底部提示信息动画控制
  void runTips() {
    const oneSec = Duration(milliseconds: 1300);
    _tipsTimer = Timer(Duration.zero, () => {});

    controller.reset(); // 重置动画
    controller.forward(); // 开始动画

    // 间隔一秒后执行 隐藏
    _tipsTimer = Timer(oneSec, () {
      controller.reset();
    });
  }
}
