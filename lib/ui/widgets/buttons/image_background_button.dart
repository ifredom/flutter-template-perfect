import 'package:flutter/material.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';

//自定义按钮
class ImageBackgroundButton extends StatelessWidget {
  ImageBackgroundButton({
    this.image,
    this.width,
    this.height,
    this.style,
    this.onPressed,
    this.borderRadius,
    @required this.text,
  });

  // 渐变色数组
  final ImageProvider image;

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
    return Container(
      width: this.width ?? ScreenUtil().setSp(162.0),
      height: this.height ?? ScreenUtil().setHeight(50),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitWidth,
          image: this.image ?? null,
        ),
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
                  fontSize: ScreenUtil().setSp(30.0),
                ),
          ),
        ),
      ),
    );
  }
}
