import 'package:flutter/material.dart';

// https://blog.csdn.net/honeylife/article/details/93195214
class AppbarRightView extends StatelessWidget {
  VoidCallback rightClick;
  Widget child;

  AppbarRightView({this.rightClick, this.child});

  @override
  Widget build(BuildContext context) {
    return this.child;
  }
}
