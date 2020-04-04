import 'package:flutter/material.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/core/view_models/teacher/teacher_home_student_model.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/provider_widget.dart';

class StudentInfoMenu extends ProviderWidget<TeacherHomeStudentModel> {
  final num defaultIndex; // 此参数有问题，优化为部分构建后，可修复
  StudentInfoMenu({Key key, this.defaultIndex = 1}) : super(key: key, listen: true);

  @override
  Widget build(BuildContext context, TeacherHomeStudentModel model) {
    return Container(
      height: ScreenUtil().setWidth(700),
      padding: EdgeInsets.symmetric(
        vertical: ScreenUtil().setSp(21),
        horizontal: ScreenUtil().setSp(32),
      ),
      decoration: new BoxDecoration(
        color: HexToColor('#F7F2FF'),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Column(
              children: <Widget>[
                BuildItemMenu(
                  index: 1,
                  text: "资料",
                  icon: model.studentDialogMenuIndex == 1
                      ? 'assets/images/teacher_home/student_info/date_checking.png'
                      : 'assets/images/teacher_home/student_info/date.png',
                  active: model.studentDialogMenuIndex == 1,
                ),
                Gaps.vGap42,
                BuildItemMenu(
                  index: 2,
                  text: "成就",
                  icon: model.studentDialogMenuIndex == 2
                      ? 'assets/images/teacher_home/student_info/achievement_checking.png'
                      : 'assets/images/teacher_home/student_info/achievement.png',
                  active: model.studentDialogMenuIndex == 2,
                ),
                Gaps.vGap42,
                BuildItemMenu(
                  index: 3,
                  text: "历程",
                  icon: model.studentDialogMenuIndex == 3
                      ? 'assets/images/teacher_home/student_info/course_checking.png'
                      : 'assets/images/teacher_home/student_info/course.png',
                  active: model.studentDialogMenuIndex == 3,
                ),
                Gaps.vGap42,
                BuildItemMenu(
                  index: 4,
                  text: "能力",
                  icon: model.studentDialogMenuIndex == 4
                      ? 'assets/images/teacher_home/student_info/ability_checking.png'
                      : 'assets/images/teacher_home/student_info/ability.png',
                  active: model.studentDialogMenuIndex == 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildItemMenu extends ProviderWidget<TeacherHomeStudentModel> {
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
  Widget build(BuildContext context, TeacherHomeStudentModel model) {
    return GestureDetector(
      child: Consumer<TeacherHomeStudentModel>(builder: (context, snapshot, child) {
        return Container(
          width: ScreenUtil().setWidth(188),
          padding: EdgeInsets.fromLTRB(
            ScreenUtil().setSp(14),
            ScreenUtil().setSp(17),
            ScreenUtil().setSp(44),
            ScreenUtil().setSp(17),
          ),
          decoration: new BoxDecoration(
            color: this.active ? null : HexToColor('#C7B8E6'),
            gradient: active
                ? LinearGradient(colors: [
              HexToColor('#6134A9'),
              HexToColor('#9665CE'),
            ])
                : null, // 渐
            borderRadius: BorderRadius.circular(ScreenUtil().setSp(27)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset(
                icon,
                width: ScreenUtil().setHeight(46),
                height: ScreenUtil().setHeight(46),
              ),
              Gaps.hGap10,
              Text(
                text,
                style: TextStyle(
                  color: active ? HexToColor('#ffffff') : HexToColor('#8A5AC6'),
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ],
          ),
        );
      }),
      onTap: () {
        if (index != model.studentDialogMenuIndex) {
          model.changeStudentMenuIndex(index);
        }
      },
    );
  }
}


