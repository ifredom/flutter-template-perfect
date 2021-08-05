import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluter_template_perfect/ui/root/start_up_view_model.dart';
import 'package:fluter_template_perfect/ui/widgets/loading/loading_animation.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 初始化缩放比例
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: Size(750, 1334), // 设计稿尺寸
      orientation: Orientation.portrait,
    );
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: LoadingAnimation(),
        ),
      ),
    );
  }
}
