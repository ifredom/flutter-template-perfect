import 'package:flutter/material.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/ui/widgets/buttons/custom_button.dart';
import 'package:template/ui/widgets/buttons/gradient_button.dart';

class TeacherHomeInfo extends StatelessWidget {
  final int type;
  const TeacherHomeInfo({Key key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == 1
        ? Container(
            width: ScreenUtil().setWidth(1550),
            height: ScreenUtil().setHeight(919),
            child: _buildMessage(),
          )
        : type == 2
            ? Container(
                width: ScreenUtil().setWidth(1550),
                height: ScreenUtil().setHeight(919),
                child: _buildTask(),
              )
            : type == 3
                ? Container(
                    width: ScreenUtil().setWidth(1550),
                    height: ScreenUtil().setHeight(919),
                    child: Text("33333"))
                : type == 4
                    ? Container(
                        width: ScreenUtil().setWidth(1550),
                        height: ScreenUtil().setHeight(919),
                        child: Text("44444"))
                    : Container();
  }
}

// 消息模块
Widget _buildMessage() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return _buildMessageListItem();
    },
  );
}

// 消息体
Widget _buildMessageListItem() {
  return Column(
    children: <Widget>[
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(26.0)),
        ),
        width: ScreenUtil().setWidth(1550),
        height: ScreenUtil().setHeight(260),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(151),
                      height: ScreenUtil().setHeight(57),
                      child: Image.asset(
                        "assets/images/teacher_home/tab.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      "作业",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(24),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: ScreenUtil().setWidth(34),
                    ),
                    Image.asset("assets/images/teacher_home/headPhoto.png",
                        width: ScreenUtil().setWidth(46),
                        height: ScreenUtil().setHeight(46)),
                    SizedBox(
                      width: ScreenUtil().setWidth(35),
                    ),
                    Text(
                      "张晓峰",
                      style: TextStyle(
                        color: HexToColor("#8A5AC6"),
                        fontSize: ScreenUtil().setSp(30),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(16),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: ScreenUtil().setWidth(34),
                    ),
                    Text(
                      "我完成了今日作业[跳舞的雨滴七日打卡]",
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(28),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(16),
                ),
                Row(
                  children: <Widget>[
                    SizedBox(
                      width: ScreenUtil().setWidth(34),
                    ),
                    Text(
                      "09/05 20:28",
                      style: TextStyle(
                        color: HexToColor("#999999"),
                        fontSize: ScreenUtil().setSp(26),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Text(
                  "查看",
                  style: TextStyle(
                    color: HexToColor("#848484"),
                    fontSize: ScreenUtil().setSp(29),
                  ),
                ),
                Gaps.hGap14,
                Image.asset("assets/images/teacher_home/right.png",
                    width: ScreenUtil().setWidth(15),
                    height: ScreenUtil().setHeight(25)),
                Gaps.hGap57,
              ],
            ),
          ],
        ),
      ),
      Container(
        width: ScreenUtil().setWidth(1550),
        height: ScreenUtil().setHeight(20),
      ),
    ],
  );
}

// 作业模块
Widget _buildTask() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (BuildContext context, int index) {
      return _buildTaskListItem();
    },
  );
}

Widget _buildTaskListItem() {
  return Column(children: <Widget>[
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(26.0)),
      ),
      width: ScreenUtil().setWidth(1550),
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(1550),
                height: ScreenUtil().setHeight(77),
                decoration: BoxDecoration(
                  color: HexToColor("#8A5AC6"),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26.0),
                      topRight: Radius.circular(26.0)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        width: ScreenUtil().setWidth(34),
                      ),
                      Image.asset("assets/images/teacher_home/headPhoto.png",
                          width: ScreenUtil().setWidth(46),
                          height: ScreenUtil().setHeight(46)),
                      SizedBox(
                        width: ScreenUtil().setWidth(35),
                      ),
                      Text(
                        "张晓峰",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(30),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Image.asset(
                        "assets/images/teacher_home/taskTab.png",
                        width: ScreenUtil().setWidth(24),
                        height: ScreenUtil().setHeight(26),
                      ),
                      Gaps.hGap6,
                      Text(
                        "历史作业",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(24),
                        ),
                      ),
                      Gaps.hGap4,
                      Image.asset(
                        "assets/images/teacher_home/whiteRight.png",
                        width: ScreenUtil().setWidth(9),
                        height: ScreenUtil().setHeight(16),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(35),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setHeight(27),
              ),
              Flex(
                direction: Axis.horizontal,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: ScreenUtil().setWidth(38),
                        ),
                        Text(
                          "跳舞的雨滴",
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(30),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Text("跳舞的雨滴"),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Gaps.hGap140,
                        CustomButton(
                          width: ScreenUtil().setWidth(110),
                          height: ScreenUtil().setHeight(56),
                          text: "查看",
                          colors: [
                            HexToColor("#FFA53E"),
                            HexToColor("#FFB82C")
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(27),
              ),
            ],
          ),
        ],
      ),
    ),
    Container(
      width: ScreenUtil().setWidth(1550),
      height: ScreenUtil().setHeight(20),
    ),
  ]);
}
