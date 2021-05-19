import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    final List<Color> _colors = this.colors ?? List.empty();

    Color _backgroundColors; // 单色
    LinearGradient _linearGradient; // 渐变色

    if (_colors.isEmpty) {
      _backgroundColors = theme.primaryColorDark ?? theme.primaryColor;
      _linearGradient = null;
    } else if (_colors.length == 1) {
      _backgroundColors = _colors[0];
      _linearGradient = null;
    } else {
      _backgroundColors = null;
      _linearGradient = LinearGradient(colors: _colors);
    }

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      // onPrimary: Colors.transparent,
      primary: Colors.transparent, // transparent
      padding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    ).merge(
      ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return states.contains(MaterialState.pressed) ? Colors.transparent : null; //点击时，水波动画中水波的颜色
        }),
        elevation: MaterialStateProperty.resolveWith((states) => 0),
      ),
    );

    return Container(
        width: this.width ?? 64,
        height: this.height ?? 36,
        decoration: BoxDecoration(
          color: _backgroundColors,
          gradient: _linearGradient,
          borderRadius: borderRadius ?? BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            null == this.prefixIcon ? SizedBox() : this.prefixIcon,
            ElevatedButton(
              style: raisedButtonStyle,
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
                        fontSize: 15,
                      ),
                ),
              ),
            ),
          ],
        ));
  }
}
