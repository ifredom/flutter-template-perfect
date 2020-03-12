import 'package:flutter/material.dart';

class HexToColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    // 如果传入的十六进制颜色值不符合要求，返回默认值
    if (hexColor == null ||
        hexColor.length != 6 ||
        int.tryParse(hexColor.substring(0, 6), radix: 16) == null) {
      hexColor = '103580';
    }
    hexColor = "FF" + hexColor;
    return int.parse(hexColor, radix: 16);
  }

  HexToColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
