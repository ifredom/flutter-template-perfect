import 'dart:math';

import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:flutter/material.dart';
import 'package:chinaculture/routers/navigator_utils.dart';
import 'package:chinaculture/utils/common/ScreenUtil.dart';

enum BackImageMode { light, black }

/*
 * @Description: 自定义导航栏
 * @Date: 2020-02-18 02:14:31
 * @Author: ifredom
 */
class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  // 高度
  final double height;
  // 默认显示左侧按钮
  final bool defaultLeft;
  // 左侧widget
  final Widget frontWidget;
  // 右侧widget
  final Widget trailingWidget;
  // 标题颜色
  final TextStyle style;
  // 背景模式，默认有两种
  final BackImageMode backImageMode;
  //透明度
  final double opacity;
  // 中间，标题文字
  final String title;
  //中间视图
  final Widget middle;
  // 背景视图
  final Widget background;
  // 背景颜色数组,支持渐变色
  final List<Color> colors;

  CustomAppbar({
    @required this.title,
    this.height = 50,
    this.opacity = 1.0,
    this.colors,
    this.style,
    this.background,
    this.middle,
    this.defaultLeft = true,
    this.frontWidget,
    this.trailingWidget,
    this.backImageMode = BackImageMode.light,
  }) : super();

  @override
  Size get preferredSize => new Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    List _widgetColors = this.colors ?? List();
    Color _backgroundColors = HexToColor("#1E90FF");
    LinearGradient _linearGradient;

    //透明度（0 ～ 1）
    double _opacity = max(min(this.opacity, 1), 0);

    // 背景色
    if (_widgetColors.length == 0) {
      // 默认背景色
      _linearGradient = null;
    } else if (_widgetColors.length == 1) {
      // 背景单色
      _backgroundColors = _widgetColors[0];
      _linearGradient = null;
    } else {
      // 背景渐变色
      _backgroundColors = null;
      _linearGradient = LinearGradient(colors: _widgetColors);
    }

    // 左侧组件
    Widget _frontWidget = this.frontWidget;
    if (null == _frontWidget && defaultLeft) {
      _frontWidget = this.backImageMode == BackImageMode.light
          ? Image.asset(
              "assets/image/custom/back.png",
              fit: BoxFit.fitHeight,
              height: this.preferredSize.height,
            )
          : Image.asset(
              "assets/image/custom/back2.png",
              fit: BoxFit.fitHeight,
              height: this.preferredSize.height,
            );
    }

    //数据处理
    //背景视图
    Widget _background = this.background;
    if (_background == null) {
      _background = Container(
        decoration: BoxDecoration(
          color: _backgroundColors,
          gradient: _linearGradient,
        ),
        child: null,
      );
    }

    // 中间组件，标题样式
    TextStyle _textStyle = this.style ??
        TextStyle(
          fontSize: ScreenUtil().setSp(54),
          color: this.backImageMode == BackImageMode.black
              ? HexToColor('#ffffff')
              : HexToColor('#5324B3'),
          fontWeight: FontWeight.bold,
        );
    // 中间组件
    Widget _middle = this.middle;
    if (null == _middle) {
      _middle = Container(
        alignment: Alignment.center,
        child: Text(this.title, style: _textStyle),
      );
    }

    return Opacity(
      opacity: _opacity,
      child: Stack(
        children: <Widget>[
          // 底部背景
          Container(
            height: this.preferredSize.height,
            child: _background,
          ),

          // 覆盖在背景上得内容
          Container(
            child: Row(
              children: <Widget>[
                // 左侧视图
                GestureDetector(
                  child: _frontWidget,
                  onTap: () {
                    NavigatorUtils.goBack(context);
                  },
                ),
                //中间视图
                Expanded(
                  child: _middle,
                ),
                // 右侧视图
                Container(
                  margin: const EdgeInsets.only(right: 24),
                  child: this.trailingWidget ?? null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
