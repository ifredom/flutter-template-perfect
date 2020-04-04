import 'package:flutter/material.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/resources.dart';

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
    @required this.text,
  });

  // 渐变色数组
  final List<Color> colors;

  // 按钮宽高
  final double width;
  final double height;

  final String text;
  final TextStyle style;
  final Widget prefixIcon;
  final BorderRadius borderRadius;

  //点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final List<Color> _colors = this.colors ?? List();

    Color _backgroundColors; // 单色
    LinearGradient _linearGradient; // 渐变色

    if (_colors.length == 0) {
      _backgroundColors = theme.primaryColorDark ?? theme.primaryColor;
      _linearGradient = null;
    } else if (_colors.length == 1) {
      _backgroundColors = _colors[0];
      _linearGradient = null;
    } else {
      _backgroundColors = null;
      _linearGradient = LinearGradient(colors: _colors);
    }

    return Container(
        width: this.width ?? ScreenUtil().setSp(180.0),
        height: this.height ?? ScreenUtil().setHeight(50),
        decoration: BoxDecoration(
          color: _backgroundColors,
          gradient: _linearGradient,
          borderRadius: borderRadius ?? BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            null == this.prefixIcon ? Gaps.empty : this.prefixIcon,
            // GestureDetector(
            //   child: Text(
            //     text,
            //     style: style ??
            //         TextStyle(
            //           color: Colors.white,
            //           fontSize: ScreenUtil().setSp(24.0),
            //         ),
            //   ),
            //   onTap: () {
            //     onPressed();
            //   },
            // ),
            RaisedButton(
              color: Colors.transparent, // 设为透明色
              elevation: 0, // 正常时阴影隐藏
              highlightElevation: 0, // 点击时阴影隐藏
              //点击时，水波动画中水波的颜色
              splashColor: Colors.black12,
              //内边距
              padding: EdgeInsets.zero,
              onPressed: () {
                onPressed();
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: style ??
                      TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(24.0),
                      ),
                ),
              ),
            ),
          ],
        ));
  }
}
