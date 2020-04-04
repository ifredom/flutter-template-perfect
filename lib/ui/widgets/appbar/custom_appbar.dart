import 'dart:math';

import 'package:flutter/material.dart';
import 'package:template/core/services/navigation/navigation_service.dart';

import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/locator.dart';

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

  //默认 _actionW * count 如果超过需要设置
  final double actionsMaxW;

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
    this.actionsMaxW,
    this.backImageMode = BackImageMode.light,
  }) : assert(title != null);

  @override
  Size get preferredSize => new Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    double _actionsMaxW = 94.0;
    List _widgetColors = this.colors ?? List();
    Color _backgroundColors;
    LinearGradient _linearGradient;

    //透明度（0 ～ 1）
    double _opacity = max(min(this.opacity, 1), 0);

    // 背景色
    if (_widgetColors.length == 0) {
      // 默认背景色
      _backgroundColors = HexToColor("#F7F2FF");
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
              "assets/images/custom/back.png",
              fit: BoxFit.fitWidth,
              height: this.preferredSize.height,
            )
          : Image.asset(
              "assets/images/custom/back2.png",
              fit: BoxFit.fitWidth,
              height: this.preferredSize.height,
            );
    }

    //数据处理
    //背景视图
    Widget _background = this.background;
    if (_background == null) {
      _background = Container(
        decoration: BoxDecoration(
          color: _backgroundColors ?? HexToColor('#F7F2FF'),
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
    print(null == _middle);
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // 左侧视图
                Container(
                  width: _actionsMaxW,
                  child: GestureDetector(
                    child: _frontWidget,
                    onTap: () {
                      locator<NavigationService>().pop();
                    },
                  ),
                ),

                //中间视图
                Expanded(
                  child: _middle,
                ),

                // 右侧视图
                Container(
                  width: _actionsMaxW,
                  child: (null == this.trailingWidget)
                      ? null
                      : this.trailingWidget,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
