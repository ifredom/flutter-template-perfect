import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/utils/common/color_utils.dart';

class AppTheme {
  AppTheme._();

  static setTheme({String themeMode = 'light'}) {
    final _lightThemeData = ThemeData.light();
    final _darkThemeData = ThemeData.dark();

    final primaryMaterialTheme = _lightThemeData.copyWith(
      textTheme: _lightThemeData.textTheme.apply(
        fontFamily: 'Open Sans',
      ),
    );
    final darkMaterialTheme = _darkThemeData.copyWith(
      textTheme: _darkThemeData.textTheme.apply(
        fontFamily: 'Open Sans',
      ),
    );
    return themeMode == 'light' ? primaryMaterialTheme : darkMaterialTheme;
  }

  static Color background = HexToColor("#f3f9f1");
  static const Color scaffoldBackgroundColor = Color(0xFFEDF0F2); // 整体的scaffold背景颜色
  static const Color iconColor = Color(0xFFEDF0F2);
  static const Color primaryIconColor = Color(0xFFEDF0F2); // 导航栏按钮颜色

  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static const Color notWhite = Color(0xFFEDF0F2);
  static const Color nearlyWhite = Color(0xFFFEFEFE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const String fontName = 'WorkSans';

  static ThemeData themData = ThemeData(
    textTheme: textTheme,
    iconTheme: iconTheme,
    primaryIconTheme: iconTheme, // primaryIconTheme 导航栏按钮颜色
    colorScheme: ColorScheme.highContrastLight(), // 选中颜色colorScheme.secondary
    primaryColor: background,
    scaffoldBackgroundColor: scaffoldBackgroundColor,
  );

  static const TextTheme textTheme = TextTheme(
    bodySmall: caption,
  );

  static const TextStyle headline = TextStyle(
    // h5 -> headline
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    letterSpacing: 0.27,
    color: darkerText,
  );

  static const TextStyle title = TextStyle(
    // h6 -> title
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: 16,
    letterSpacing: 0.18,
    color: darkerText,
  );

  static const TextStyle subtitle = TextStyle(
    // subtitle2 -> subtitle
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: -0.04,
    color: darkText,
  );

  static const TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
  static const IconThemeData iconTheme = IconThemeData(
    size: 32,
    color: Colors.red,
    opacity: 0.9,
  );
}
