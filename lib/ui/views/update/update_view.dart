import 'package:flutter/material.dart';
import 'package:fluttertemplate/ui/widgets/custom/screen.dart';

import 'update_viewmodel.dart';

class UpdateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenBuilder<UpdateViewModel>(
        viewModel: UpdateViewModel(),
        builder: (context, uiHelpers, model) => Scaffold(
              appBar: AppBar(),
              body: Text("Update View"),
            ));
  }
}
