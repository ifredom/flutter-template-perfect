import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/ui/root/start_up_view_model.dart';
import 'package:template/ui/widgets/loading/loading_animation.dart';
import 'package:provider_architecture/provider_architecture.dart';

class StartUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return ViewModelProvider<StartUpViewModel>.withConsumer(
      viewModel: StartUpViewModel(),
      onModelReady: (model) => model.handleStartUpLogic(),
      builder: (context, model, child) => PlatformScaffold(
        body: Center(
          child: LoadingAnimation(),
        ),
      ),
    );
  }
}
