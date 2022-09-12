// import 'package:flare_flutter/flare_actor.dart';
import 'package:rive/rive.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/constants/animations.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: RiveAnimation.asset(Animations.loader),
    );
  }
}
