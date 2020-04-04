import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/view_models/teacher/teacher_home_model.dart';
import 'package:template/ui/teacher_pages/teacher_home/child/teacher_home_info.dart';
import 'package:template/ui/teacher_pages/teacher_home/child/teacher_home_left_menu.dart';
import 'package:template/ui/teacher_pages/teacher_home/child/teacher_home_top_menu.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

class TeacherHome extends StatefulWidget {
  TeacherHome({Key key}) : super(key: key);

  @override
  _TeacherHomeState createState() => _TeacherHomeState();
}

class _TeacherHomeState extends State<TeacherHome>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    ScreenUtil.init(context);
    print(
        'TeacherHome页面rebuild,页面宽：$screenWidth , 高:$screenHeight-------------');
    return ViewModelProvider<TeacherHomeModel>.withConsumer(
      viewModel: TeacherHomeModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        return PlatformScaffold(
          body: Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/bg/teacher_home2.png"),
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Positioned(
                  left: 0,
                  child: TeacherHomeLeftMenu(),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(30),
                  child: TeacherHomeTopMenu(
                    type: model.activeMenuIndex,
                    tabController:
                        new TabController(vsync: this, length: model.length),
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(124),
                  left: ScreenUtil().setWidth(281),
                  child: TeacherHomeInfo(
                    type: model.activeMenuIndex,
                  ),
                ),
              ],
            ),
              ),
        );
      },
    );
  }
}
