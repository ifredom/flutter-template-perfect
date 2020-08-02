import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:stacked/stacked.dart';
import '../../core/utils/common/ScreenUtil.dart';
import '../widgets/loading/loading_animation.dart';
import 'start_up_view_model.dart';
class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: ()=>StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => PlatformScaffold(
        body: Center(
          child: LoadingAnimation(),
        ),
      ),
    );
  }
}
