import 'package:flutter/material.dart';
import 'package:template/ui/pages/login/login_view.dart';

import 'drawer_user_controller.dart';
import 'home_drawer.dart';

class DrawerExample extends StatefulWidget {
  @override
  _DrawerExampleState createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {
  AnimationController sliderAnimationController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DrawerUserController(
        screenIndex: DrawerIndex.HOME,
        drawerWidth: MediaQuery.of(context).size.width * 0.75,
        animationController: (AnimationController animationController) {
          sliderAnimationController = animationController;
        },
        screenView: LoginView(), //任何页面
      ),
    );
  }
}
