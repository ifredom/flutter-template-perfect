import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/ui/root/start_up_view_model.dart';
import 'package:template/ui/widgets/loading/loading_animation.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: ()=>StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: LoadingAnimation(),
        ),
      ),
    );
  }
}
