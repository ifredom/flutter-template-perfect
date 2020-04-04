import 'package:flutter/material.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/ui/teacher_pages/teacher_home/child/student_info_menu.dart';

import '../../../../locator.dart';

class TeacherHomeDialogWrapper extends StatelessWidget {
  final Widget child;
  final String title;
  final double height;
  final double width;

  TeacherHomeDialogWrapper({
    Key key,
    @required this.child,
    this.title,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          /// 透明色背景，使标题定位在外部。
          BuildOutRangeTitle(title: title),
          Gaps.vGap10,
          Container(
            width: width ?? ScreenUtil().setWidth(1650),
            height: height ?? ScreenUtil().setHeight(815),
            padding: EdgeInsets.symmetric(
              vertical: ScreenUtil().setHeight(35),
              horizontal: ScreenUtil().setHeight(42),
            ),
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.6283333),
            decoration: new BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                    "assets/images/bg/teacher_home_student_info.png"),
              ),
            ),
            child: Stack(
              alignment: AlignmentDirectional.topStart,
              children: <Widget>[
                child,
                Positioned(
                  top: ScreenUtil().setSp(0),
                  right: ScreenUtil().setSp(0),

                  /// 设计图53 - padding42 = 11
                  child: BuildCLoseButton(),
                ),
                Positioned(
                  bottom: ScreenUtil().setSp(0),
                  left: ScreenUtil().setSp(725),

                  /// 设计图53 - padding42 = 11
                  child: GestureDetector(
                    child: Row(
                      children: <Widget>[
                        Image.asset(
                          "assets/images/teacher_home/student_dialog_work.png",
                          width: ScreenUtil().setSp(55),
                          height: ScreenUtil().setSp(55),
                        ),
                        Gaps.vGap10,
                        Text(
                          "留作业",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(40),
                              color: HexToColor("#FFFFFF")),
                        ),
                      ],
                    ),
                    onTap: () {
                      print("qqqq");
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BuildCLoseButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          child: Image.asset(
            'assets/images/custom/close@2x.png',
            width: ScreenUtil().setHeight(32),
            height: ScreenUtil().setHeight(32),
          ),
        ),
      ),
      onTap: () {
        locator<NavigationService>().pop();
      },
    );
  }
}

class BuildOutRangeTitle extends StatelessWidget {
  final String title;

  BuildOutRangeTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: ScreenUtil().setSp(50),
        ),
      ),
    );
  }
}
