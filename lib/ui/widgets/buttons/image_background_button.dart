import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          image: this.image,
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(25),
      ),
      child: TextButton(
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
