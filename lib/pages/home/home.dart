import 'package:chinaculture/routers/modules/homework_route.dart';
import 'package:chinaculture/routers/navigator_utils.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:chinaculture/utils/res/resources.dart';
import 'package:chinaculture/widgets/appbar/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onAdd() {}

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    print('screenWidth：$screenWidth , screenWidth:$screenHeight');

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbar(
          title: '首页',
          trailingWidget: GestureDetector(
            child: Text("homework"),
            onTap: () {
              NavigatorUtils.push(context, HomeworkRouter.homeworkIndexPage);
            },
          ),
        ),
        body: Container(
          color: HexToColor("#F0F8FF"),
          child: Center(
            child: Column(
              children: <Widget>[
                Gaps.vGap40,
                Text("Welcome to home page"),
                Gaps.vGap20,
                Text("这是一个商用级完整项目模板"),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // 悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd,
        ),
      ),
    );
  }
}
