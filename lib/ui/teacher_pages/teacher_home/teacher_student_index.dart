import 'package:flutter/material.dart';
import 'package:template/core/view_models/teacher/teacher_home_student_model.dart';
import 'package:template/ui/teacher_pages/teacher_home/child/teacher_home_dialog_wrapper.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

import 'child/student_info_menu.dart';

class TeacherStudentIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<TeacherHomeStudentModel>.withConsumer(
      viewModel: TeacherHomeStudentModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => TeacherHomeDialogWrapper(
        title: model.title,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
//            StudentInfoMenu()
            StudentInfoMenu(),
            Text("1231")
          ],
        ),
      ),
    );
  }
}
