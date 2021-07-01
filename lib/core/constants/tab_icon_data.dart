import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    required this.animationController
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController animationController = AnimationController(vsync:);

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/images/tab_1.png',
      selectedImagePath: 'assets/images/tab_1s.png',
      index: 0,
      isSelected: true,
      animationController: animationController,
    ),
    TabIconData(
      imagePath: 'assets/images/tab_2.png',
      selectedImagePath: 'assets/images/tab_2s.png',
      index: 1,
      isSelected: false,
      // animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/tab_3.png',
      selectedImagePath: 'assets/images/tab_3s.png',
      index: 2,
      isSelected: false,
      // animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/images/tab_4.png',
      selectedImagePath: 'assets/images/tab_4s.png',
      index: 3,
      isSelected: false,
      // animationController: null,
    ),
  ];

  get animationController => null;

  set animationController(AnimationController animationController) {}
}
