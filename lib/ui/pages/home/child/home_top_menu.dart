import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/constants/formatter_text.dart';

import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/ui/pages/home/home_view_model.dart';


import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/dimens.dart';
import 'package:template/core/utils/res/gaps.dart';

import '../../../routers.dart';

class HomeTopMenu extends ViewModelWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Gaps.hGap42,
        BuildPortrait(),
        Gaps.hGap50,
        Expanded(
          flex: 4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              BuildMessageNotice(),
              BuildDiamonds(),
              BuildGoldCoin(),
              Gaps.hGap30,
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              BuildEmail(),
              Gaps.hGap30,
              BuildSetting(),
            ],
          ),
        )
      ],
    );
  }
}

class BuildPortrait extends ViewModelWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 0, ScreenUtil().setSp(60), 0),
          height: ScreenUtil().setSp(120),
          decoration: new BoxDecoration(
            //背景
            color: Color.fromRGBO(0, 0, 0, 0.25),
            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
            borderRadius:
                BorderRadius.all(Radius.circular(ScreenUtil().setSp(60))),
          ),
          child: Row(
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  "assets/ifredom.jpg",
                  width: ScreenUtil().setSp(120),
                  height: ScreenUtil().setSp(120),
                ),
              ),
              Gaps.hGap24,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    model.user?.nickName ?? '游客',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: HexToColor('#ffffff'),
                      fontSize: ScreenUtil().setSp(30),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Lv.${model.user?.levelCode}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: HexToColor('#ffffff'),
                          fontSize: ScreenUtil().setSp(30),
                        ),
                      ),
                      Text(
                        FormatText.formatLevelcode(model.user?.levelCode),
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: HexToColor('#ffffff'),
                          fontSize: ScreenUtil().setSp(24),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        onTap: () {});
  }
}

class BuildMessageNotice extends ViewModelWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return GestureDetector(
        child: Container(
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(60), 0),
          height: ScreenUtil().setHeight(80),
          decoration: new BoxDecoration(
            //背景
            color: Color.fromRGBO(0, 0, 0, 0.25),
            //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Row(
            children: <Widget>[
              Image.asset(
                "assets/images/index/message.png",
                width: ScreenUtil().setSp(44),
                height: ScreenUtil().setSp(44),
              ),
              Gaps.hGap15,
              Text(
                '恭喜奥特曼获得第一名',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: HexToColor('#ffffff'),
                  fontSize: Dimens.font_sp13,
                ),
              )
            ],
          ),
        ),
        onTap: () {
          // 跳转到webview测试页面
          locator<NavigationService>().push(RoutesUtils.webViewPage);
        });
  }
}

class BuildDiamonds extends ViewModelWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(20),
        ),
        height: ScreenUtil().setHeight(80),
        decoration: new BoxDecoration(
          //背景
          color: Color.fromRGBO(0, 0, 0, 0.25),
          //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/images/index/pack1.png",
              width: ScreenUtil().setHeight(62),
              height: ScreenUtil().setHeight(62),
            ),
            Gaps.hGap12,
            ConstrainedBox(
                constraints:
                    BoxConstraints(maxWidth: ScreenUtil().setWidth(140)),
                child: Text(
                  model.musicStone.toString(),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.clip,
                  maxLines: 1,
                  style: TextStyle(
                    color: HexToColor('#ffffff'),
                    fontSize: ScreenUtil().setHeight(34),
                  ),
                ))
          ],
        ),
      ),
      onTap: () {
        locator<NavigationService>().push(RoutesUtils.webViewPage);
      },
    );
  }
}

class BuildGoldCoin extends ViewModelWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20),
      ),
      height: ScreenUtil().setHeight(80),
      decoration: new BoxDecoration(
        //背景
        color: Color.fromRGBO(0, 0, 0, 0.25),
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/index/pack2.png",
            width: ScreenUtil().setHeight(62),
            height: ScreenUtil().setHeight(62),
          ),
          Gaps.hGap12,
          ConstrainedBox(
              constraints: BoxConstraints(maxWidth: ScreenUtil().setWidth(140)),
              child: Text(
                model.musicNote.toString(),
                textAlign: TextAlign.center,
                overflow: TextOverflow.clip,
                maxLines: 1,
                style: TextStyle(
                  color: HexToColor('#ffffff'),
                  fontSize: ScreenUtil().setHeight(34),
                ),
              ))
        ],
      ),
    );
  }
}

class BuildEmail extends ViewModelWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setWidth(20),
      ),
      height: ScreenUtil().setHeight(80),
      decoration: new BoxDecoration(
        //背景
        color: Color.fromRGBO(0, 0, 0, 0.25),
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      child: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/index/pack3.png",
            width: ScreenUtil().setSp(62),
            height: ScreenUtil().setSp(62),
          ),
        ],
      ),
    );
  }
}

class BuildSetting extends ViewModelWidget<HomeViewModel> {

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(20),
        ),
        height: ScreenUtil().setHeight(80),
        decoration: new BoxDecoration(
          //背景
          color: Color.fromRGBO(0, 0, 0, 0.25),
          //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
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
      ),
      onTap: () {
        // useRootNavigator默认为true，设置为flase非常重要，从最近的节点获取context
        // showDialog(
        //   context: context,
        //   useRootNavigator: false,
        //   barrierDismissible: false,
        //   builder: (_) => SettingIndex(),
        // );
      },
    );
  }
}
