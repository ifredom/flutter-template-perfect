import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'package:fluttertemplate/ui/views/start_up/start_up_view_model.dart';
import 'package:fluttertemplate/ui/widgets/loading/loading_animation.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化缩放比例
    // ScreenUtil.init(
    //   BoxConstraints(
    //     maxWidth: MediaQuery.of(context).size.width,
    //     maxHeight: MediaQuery.of(context).size.height,
    //   ),
    //   designSize: Size(750, 1334), // 设计稿尺寸
    //   orientation: Orientation.portrait,
    // );
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: LoadingAnimation(),
        ),
      ),
    );
  }
}
