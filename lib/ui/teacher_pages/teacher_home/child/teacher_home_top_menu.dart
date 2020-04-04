import 'package:flutter/material.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/dimens.dart';

class TeacherHomeTopMenu extends StatefulWidget {
  final int type;
  final TabController tabController;
  TeacherHomeTopMenu({Key key,this.type,this.tabController}) : super(key: key);

  @override
  _TeacherHomeTopMenuState createState() => _TeacherHomeTopMenuState();
}

class _TeacherHomeTopMenuState extends State<TeacherHomeTopMenu> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    widget.tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        widget.type == 1
            ? SizedBox(width: ScreenUtil().setWidth(1407))
            : widget.type == 2
            ? Row(
          children: <Widget>[
            SizedBox(
              width: ScreenUtil().setWidth(288),
            ),
            _buildTask(context, widget.tabController),
            SizedBox(
              width: ScreenUtil().setWidth(200),
            ),
          ],
        )
            : widget.type == 3
            ? Row(
          children: <Widget>[
            SizedBox(
              width: ScreenUtil().setWidth(288),
            ),
            _buildStudent(context, widget.tabController),
            SizedBox(
              width: ScreenUtil().setWidth(649),
            ),
          ],
        )
            : widget.type == 4
            ? Row(
          children: <Widget>[
            SizedBox(
              width: ScreenUtil().setWidth(288),
            ),
            _buildTeacherPlan(context, widget.tabController),
            SizedBox(
              width: ScreenUtil().setWidth(392),
            ),
          ],
        )
            : (Container()),
        Row(
          children: <Widget>[
            _buildDiamonds(context),
            SizedBox(
              width: ScreenUtil().setWidth(24),
            ),
            _buildRanking(context),
          ],
        ),
      ],
    );
  }
}




Widget _buildStudent(BuildContext context, TabController tabController) {
  return Container(
    decoration: BoxDecoration(
      //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(47.0)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
          )
        ]),
    width: ScreenUtil().setWidth(476),
    height: ScreenUtil().setHeight(68),
    padding: EdgeInsets.fromLTRB(
        ScreenUtil().setWidth(8),
        ScreenUtil().setHeight(7),
        ScreenUtil().setWidth(8),
        ScreenUtil().setHeight(7)),
    child: TabBar(
      controller: tabController,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(39.0)),
        color: HexToColor("#8A5AC6"),
      ),
      labelColor: HexToColor("#FFFFFF"),
      labelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(22), fontWeight: FontWeight.bold),
      unselectedLabelColor: HexToColor("#8A5AC6"),
      unselectedLabelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(22), fontWeight: FontWeight.w400),
      tabs: <Widget>[
        Center(
          child: Text(
            '当前学员',
          ),
        ),
        Center(
          child: Text(
            '毕业学员',
          ),
        ),
      ],
      onTap: (index) {
        // eventBus.fire(new ChartEvent(index + 1, _deviceMac));
      },
    ),
  );
}

Widget _buildTask(BuildContext context, TabController tabController) {
  return Container(
    decoration: BoxDecoration(
      //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(47.0)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
          )
        ]),
    width: ScreenUtil().setWidth(740),
    height: ScreenUtil().setHeight(68),
    padding: EdgeInsets.fromLTRB(
        ScreenUtil().setWidth(8),
        ScreenUtil().setHeight(7),
        ScreenUtil().setWidth(8),
        ScreenUtil().setHeight(7)),
    child: TabBar(
      controller: tabController,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(39.0)),
        color: HexToColor("#8A5AC6"),
      ),
      labelColor: HexToColor("#FFFFFF"),
      labelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(22), fontWeight: FontWeight.bold),
      unselectedLabelColor: HexToColor("#8A5AC6"),
      unselectedLabelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(22), fontWeight: FontWeight.w400),
      tabs: <Widget>[
        Center(
          child: Text(
            '今日已完成',
          ),
        ),
        Center(
          child: Text(
            '今日未完成',
          ),
        ),
        Center(
          child: Text(
            '今日无作业',
          ),
        ),
      ],
      onTap: (index) {
        // eventBus.fire(new ChartEvent(index + 1, _deviceMac));
      },
    ),
  );
}

Widget _buildTeacherPlan(BuildContext context, TabController tabController) {
  return Container(
    decoration: BoxDecoration(
      //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(47.0)),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
          )
        ]),
    width: ScreenUtil().setWidth(740),
    height: ScreenUtil().setHeight(68),
    padding: EdgeInsets.fromLTRB(
        ScreenUtil().setWidth(8),
        ScreenUtil().setHeight(7),
        ScreenUtil().setWidth(8),
        ScreenUtil().setHeight(7)),
    child: TabBar(
      controller: tabController,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(39.0)),
        color: HexToColor("#8A5AC6"),
      ),
      labelColor: HexToColor("#FFFFFF"),
      labelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(22), fontWeight: FontWeight.bold),
      unselectedLabelColor: HexToColor("#8A5AC6"),
      unselectedLabelStyle: TextStyle(
          fontSize: ScreenUtil().setSp(22), fontWeight: FontWeight.w400),
      tabs: <Widget>[
        Center(
          child: Text(
            '我的教案',
          ),
        ),
        Center(
          child: Text(
            '系统教案',
          ),
        ),
        Center(
          child: Text(
            '拓展教案',
          ),
        ),
      ],
      onTap: (index) {
        // eventBus.fire(new ChartEvent(index + 1, _deviceMac));
      },
    ),
  );
}

Widget _buildDiamonds(BuildContext context) {
  return GestureDetector(
    child: Container(
      width: ScreenUtil().setWidth(160),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(18),
      ),
      height: ScreenUtil().setHeight(68),
      decoration: new BoxDecoration(
        //背景
        color: Color.fromRGBO(0, 0, 0, 0.25),
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/index/pack1.png",
            width: ScreenUtil().setSp(54),
            height: ScreenUtil().setSp(54),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(16),
          ),
          Text(
            '36',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: HexToColor('#ffffff'),
              fontSize: Dimens.font_sp16,
            ),
          )
        ],
      ),
    ),
    onTap: () {
      // locator<NavigationService>()
      //     .push(CompletematerialRouter.completematerialPage);
    },
  );
}

Widget _buildRanking(BuildContext context) {
  return GestureDetector(
    child: Container(
      width: ScreenUtil().setWidth(239),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(18),
      ),
      height: ScreenUtil().setHeight(68),
      decoration: new BoxDecoration(
        //背景
        color: Color.fromRGBO(0, 0, 0, 0.25),
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/teacher_home/rank.png",
            width: ScreenUtil().setSp(54),
            height: ScreenUtil().setSp(54),
          ),
          Text(
            '综合排行',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: HexToColor('#ffffff'),
              fontSize: ScreenUtil().setSp(34),
            ),
          )
        ],
      ),
    ),
    onTap: () {
      // locator<NavigationService>()
      //     .push(CompletematerialRouter.completematerialPage);
    },
  );
}