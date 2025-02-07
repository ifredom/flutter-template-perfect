import 'package:flutter/material.dart';

//自定义按钮
class GradientButton extends StatelessWidget {
  const GradientButton({
    super.key,
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
    final List<Color> colors = this.colors ?? [];
    num colorMode = 0;

    Color? backgroundColors; // 单色
    LinearGradient linearGradient; // 渐变色

    if (colors.isEmpty) {
      backgroundColors = theme.primaryColorDark;
      linearGradient = const LinearGradient(colors: []);
      colorMode = 0;
    } else if (colors.length == 1) {
      backgroundColors = colors[0];
      linearGradient = const LinearGradient(colors: []);
      colorMode = 1;
    } else {
      backgroundColors = Colors.transparent;
      linearGradient = LinearGradient(colors: colors);
      colorMode = 2;
    }

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      // onPrimary: Colors.transparent,
      // primary: Colors.transparent, // transparent
      padding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
    ).merge(
      ButtonStyle(
        overlayColor: WidgetStateProperty.resolveWith((states) {
          return states.contains(WidgetState.pressed) ? Colors.transparent : null; //点击时，水波动画中水波的颜色
        }),
        elevation: WidgetStateProperty.resolveWith((states) => 0),
      ),
    );

    return Container(
        width: width ?? 128,
        height: height ?? 44,
        decoration: BoxDecoration(
          color: colorMode == 1 ? backgroundColors : null,
          gradient: colorMode == 2 ? linearGradient : null,
          borderRadius: borderRadius ?? BorderRadius.circular(24),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            prefixIcon ?? const SizedBox(),
            TextButton(
              style: raisedButtonStyle,
              onPressed: () {
                onPressed!();
              },
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  style: style ??
                      const TextStyle(
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
