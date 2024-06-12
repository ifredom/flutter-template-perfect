import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:fluttertemplate/ui/views/start_up/start_up_view_model.dart';
import 'package:fluttertemplate/ui/widgets/loading/loading_animation.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({super.key});

  @override
  Widget build(BuildContext context) {
    // use package ScreenUtil, initial
    // ScreenUtil.init(
    //   BoxConstraints(
    //     maxWidth: MediaQuery.of(context).size.width,
    //     maxHeight: MediaQuery.of(context).size.height,
    //   ),
    /// Design draft size（设计稿尺寸）
    //   designSize: Size(750, 1334),
    //   orientation: Orientation.portrait,
    // );
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onViewModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) => const Scaffold(
        body: Center(
          child: LoadingAnimation(),
        ),
      ),
    );
  }
}
