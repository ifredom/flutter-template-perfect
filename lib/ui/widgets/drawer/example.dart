import 'package:flutter/material.dart';
import 'package:fluttertemplate/ui/views/login/login_view.dart';

import 'drawer_user_controller.dart';
import 'home_drawer.dart';

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  DrawerExampleState createState() => DrawerExampleState();
}

class DrawerExampleState extends State<DrawerExample> {
  late AnimationController sliderAnimationController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DrawerUserController(
        screenIndex: DrawerIndex.HOME,
        drawerWidth: MediaQuery.of(context).size.width * 0.75,
        animationController: (AnimationController animationController) {
          sliderAnimationController = animationController;
        },
        screenView: const LoginView(), //任何页面
      ),
    );
  }
}
