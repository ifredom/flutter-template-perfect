import 'package:flutter/material.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/res/gaps.dart';

class HomeRightMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        GestureDetector(
          child: Image.asset(
            "assets/images/index/rank.png",
            width: ScreenUtil().setSp(124),
            height: ScreenUtil().setSp(124),
          ),
          onTap: () {},
        ),
        Gaps.hGap26,
        GestureDetector(
          child: Image.asset(
            "assets/images/index/shop.png",
            width: ScreenUtil().setSp(124),
            height: ScreenUtil().setSp(124),
          ),
          onTap: () {},
        ),
        Gaps.hGap26,
        GestureDetector(
          child: Image.asset(
            "assets/images/index/active.png",
            width: ScreenUtil().setSp(124),
            height: ScreenUtil().setSp(124),
          ),
          onTap: () {},
        ),
        Gaps.hGap26,
        GestureDetector(
          child: Image.asset(
            "assets/images/index/egg.png",
            width: ScreenUtil().setSp(124),
            height: ScreenUtil().setSp(124),
          ),
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSetting() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20),
      ),
      height: ScreenUtil().setHeight(80),
      decoration: new BoxDecoration(
        //背景
        color: Color.fromRGBO(0, 0, 0, 0.3),
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        //设置四周边框
        border: new Border.all(width: 1, color: Color.fromRGBO(0, 0, 0, 0.3)),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/index/pack4.png",
            width: ScreenUtil().setSp(62),
            height: ScreenUtil().setSp(62),
          ),
        ],
      ),
    );
  }
}
