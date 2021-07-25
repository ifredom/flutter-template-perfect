import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:template/core/utils/res/gaps.dart';

//自定义按钮
class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.style,
    this.prefixIcon,
    this.onPressed,
    this.borderRadius,
    required this.text,
  });

  // 渐变色数组
  final List<Color>? colors;

  // 按钮宽高
  final double? width;
  final double? height;

  final String text;
  final TextStyle? style;
  final Widget? prefixIcon;
  final BorderRadius? borderRadius;

  //点击回调
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final List<Color> _colors = this.colors ?? [];

    Color _backgroundColors; // 单色
    LinearGradient _linearGradient; // 渐变色

    if (_colors.isEmpty) {
      _backgroundColors = theme.primaryColorDark;
      _linearGradient = LinearGradient(colors: []);
    } else if (_colors.length == 1) {
      _backgroundColors = _colors[0];
      _linearGradient = LinearGradient(colors: []);
    } else {
      _backgroundColors = Colors.white;
      _linearGradient = LinearGradient(colors: _colors);
    }

    return Container(
        width: this.width ?? ScreenUtil().setWidth(180),
        height: this.height ?? ScreenUtil().setWidth(72),
        decoration: BoxDecoration(
          color: _backgroundColors,
          gradient: _linearGradient,
          borderRadius: borderRadius ?? BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            this.prefixIcon ?? Gaps.empty,
            ElevatedButton(
              // color: Colors.transparent, // 设为透明色
              // elevation: 0, // 正常时阴影隐藏
              // highlightElevation: 0, // 点击时阴影隐藏
              // //点击时，水波动画中水波的颜色
              // splashColor: Colors.black12,
              // //内边距
              // padding: EdgeInsets.zero,
              onPressed: () {
                onPressed!();
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: style ??
                      TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(30.0),
                      ),
                ),
              ),
            ),
          ],
        ));
  }
}
