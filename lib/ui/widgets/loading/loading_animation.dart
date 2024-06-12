import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/constants/animations.dart';
import 'package:rive/rive.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 50,
      child: RiveAnimation.asset(Animations.loader),
    );
  }
}
