import 'package:flutter/material.dart';
import 'package:chinaculture/utils/common/ScreenUtil.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';

//自定义按钮
class GradientButton extends StatelessWidget {
  GradientButton({
    this.colors,
    this.width,
    this.height,
    this.style,
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
  final BorderRadius borderRadius;

  //点击回调
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      width: this.width ?? ScreenUtil().setSp(162.0),
      height: this.height ?? ScreenUtil().setHeight(50),
      decoration: BoxDecoration(
        color: colors.length == 1
            ? colors[0]
            : theme.primaryColorDark ?? theme.primaryColor,
        gradient: colors.length > 1
            ? LinearGradient(
                colors: [HexToColor('#FF696A'), HexToColor('#FF894A')],
              )
            : null, // 渐变色
        borderRadius: borderRadius ?? BorderRadius.circular(25),
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.transparent, // 设为透明色
        elevation: 0, // 正常时阴影隐藏
        highlightElevation: 0, // 点击时阴影隐藏
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
    );
  }
}
