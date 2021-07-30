import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final bool isCircle;

  SkeletonBox({required this.width, required this.height, this.isCircle = false});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Divider.createBorderSide(context, width: 0.7);
    return Container(
      width: width,
      height: height,
      decoration: SkeletonDecoration(isCircle: isCircle, isDark: isDark),
    );
  }
}

/// 骨架屏 元素背景 ->形状及颜色
class SkeletonDecoration extends BoxDecoration {
  SkeletonDecoration({
    isCircle = false,
    isDark = false,
  }) : super(
          color: !isDark ? Colors.grey[350] : Colors.grey[700],
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        );
}

/// 骨架屏 元素背景 ->形状及颜色
class BottomBorderDecoration extends BoxDecoration {
  BottomBorderDecoration() : super(border: Border(bottom: BorderSide(width: 0.3)));
}

/// 骨架屏
class SkeletonList extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final int length;
  final IndexedWidgetBuilder builder;
  // 一般屏幕长度够用
  SkeletonList({this.length = 6, this.padding = const EdgeInsets.all(7), required this.builder});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool isDark = theme.brightness == Brightness.dark;

    var _baseColor = isDark ? Color(0xFF616161) : Color(0xFFD6D6D6);
    var highlightColor =
        isDark ? Color(0xFF9E9E9E) : Color.alphaBlend(theme.accentColor.withAlpha(20), Color(0xFFF5F5F5));

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
          period: Duration(milliseconds: 1200),
          baseColor: _baseColor,
          highlightColor: highlightColor,
          child: Padding(
              padding: padding,
              child: Column(
                children: List.generate(length, (index) => builder(context, index)),
              ))),
    );
  }
}
