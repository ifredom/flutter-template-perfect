import 'package:flutter/material.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/core/view_models/teacher/teacher_home_model.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_widget.dart';

import '../teacher_student_index.dart';

class TeacherHomeLeftMenu extends ProviderWidget<TeacherHomeModel> {
  @override
  Widget build(BuildContext context, TeacherHomeModel model) {
    return Container(
      width: ScreenUtil().setSp(250),
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/bg/teacher_home_left.png"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildHead(context),
          BuildItemMenu(
            index: 1,
            text: "消息",
            icon: model.activeMenuIndex == 1
                ? "assets/images/teacher_home/message_checking.png"
                : "assets/images/teacher_home/message.png",
            active: model.activeMenuIndex == 1,
          ),
          BuildItemMenu(
            index: 2,
            text: "作业",
            icon: model.activeMenuIndex == 2
                ? "assets/images/teacher_home/home_work_checking.png"
                : "assets/images/teacher_home/home_work.png",
            active: model.activeMenuIndex == 2,
          ),
          BuildItemMenu(
            index: 3,
            text: "学员",
            icon: model.activeMenuIndex == 3
                ? "assets/images/teacher_home/student_checking.png"
                : "assets/images/teacher_home/student.png",
            active: model.activeMenuIndex == 3,
          ),
          BuildItemMenu(
            index: 4,
            text: "教案",
            icon: model.activeMenuIndex == 4
                ? "assets/images/teacher_home/teaching_plan_checking.png"
                : "assets/images/teacher_home/teaching_plan.png",
            active: model.activeMenuIndex == 4,
          ),
          Gaps.vGap30
        ],
      ),
    );
  }

  Widget _buildHead(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Gaps.vGap30,
        ClipOval(
          child: Image.asset(
            "assets/ifredom.jpg",
            width: ScreenUtil().setSp(130),
            height: ScreenUtil().setSp(130),
          ),
        ),
        Gaps.vGap10,
        Text("安老师",
            style: TextStyle(
              color: HexToColor("#FFFFFF"),
              fontSize: ScreenUtil().setSp(30),
            )),
        Gaps.vGap10,
        Text("Lv.1",
            style: TextStyle(
              color: HexToColor("#FFFFFF"),
              fontSize: ScreenUtil().setSp(26),
            ))
      ],
    );
  }
}

class BuildItemMenu extends ProviderWidget<TeacherHomeModel> {
  final num index;
  final String text;
  final String icon;
  final bool active;

  BuildItemMenu({
    Key key,
    this.index,
    this.text,
    this.icon,
    this.active = false,
  }) : super(key: key, listen: true);

  @override
  Widget build(BuildContext context, TeacherHomeModel model) {
    return Column(
      children: <Widget>[
        GestureDetector(
          child:
              Consumer<TeacherHomeModel>(builder: (context, snapshot, child) {
            return Image.asset(
              icon,
              width: ScreenUtil().setSp(106),
              height: ScreenUtil().setSp(106),
            );
          }),
          onTap: () {
            print("点击菜单: $index , ${model.activeMenuIndex}");
            if (index != model.activeMenuIndex) {
              model.changeMenuIndex(index);
            }
            if (index == 3) {
              showDialog(
                useRootNavigator:false,
                context: context,
                barrierDismissible: false,
                builder: (_) => TeacherStudentIndex(),
              );
            }
          },
        ),
        Gaps.vGap10,
        Text(
          text,
          style: TextStyle(
            color: HexToColor("#FFFFFF"),
            fontSize: ScreenUtil().setSp(26),
          ),
        )
      ],
    );
  }
}
