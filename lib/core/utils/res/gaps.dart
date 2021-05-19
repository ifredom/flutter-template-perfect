import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './resources.dart';

/// 间隔
class Gaps {
  /// 水平间隔
  static final Widget hGap4 = SizedBox(width: ScreenUtil().setWidth(4));
  static final Widget hGap5 = SizedBox(width: ScreenUtil().setWidth(5));
  static final Widget hGap6 = SizedBox(width: ScreenUtil().setWidth(6));
  static final Widget hGap8 = SizedBox(width: ScreenUtil().setWidth(8));
  static final Widget hGap10 = SizedBox(width: ScreenUtil().setWidth(10));
  static final Widget hGap12 = SizedBox(width: ScreenUtil().setWidth(12));
  static final Widget hGap14 = SizedBox(width: ScreenUtil().setWidth(14));
  static final Widget hGap15 = SizedBox(width: ScreenUtil().setWidth(15));
  static final Widget hGap16 = SizedBox(width: ScreenUtil().setWidth(16));
  static final Widget hGap20 = SizedBox(width: ScreenUtil().setWidth(20));
  static final Widget hGap22 = SizedBox(width: ScreenUtil().setWidth(22));
  static final Widget hGap24 = SizedBox(width: ScreenUtil().setWidth(24));
  static final Widget hGap26 = SizedBox(width: ScreenUtil().setWidth(26));
  static final Widget hGap28 = SizedBox(width: ScreenUtil().setWidth(28));
  static final Widget hGap30 = SizedBox(width: ScreenUtil().setWidth(30));
  static final Widget hGap32 = SizedBox(width: ScreenUtil().setWidth(32));
  static final Widget hGap38 = SizedBox(width: ScreenUtil().setWidth(38));
  static final Widget hGap40 = SizedBox(width: ScreenUtil().setWidth(40));
  static final Widget hGap42 = SizedBox(width: ScreenUtil().setWidth(42));
  static final Widget hGap43 = SizedBox(width: ScreenUtil().setWidth(43));
  static final Widget hGap50 = SizedBox(width: ScreenUtil().setWidth(50));
  static final Widget hGap57 = SizedBox(width: ScreenUtil().setWidth(57));
  static final Widget hGap64 = SizedBox(width: ScreenUtil().setWidth(64));
  static final Widget hGap70 = SizedBox(width: ScreenUtil().setWidth(70));
  static final Widget hGap80 = SizedBox(width: ScreenUtil().setWidth(80));
  static final Widget hGap100 = SizedBox(width: ScreenUtil().setWidth(100));
  static final Widget hGap140 = SizedBox(width: ScreenUtil().setWidth(140));
  static final Widget hGap200 = SizedBox(width: ScreenUtil().setWidth(200));
  static final Widget hGap190 = SizedBox(width: ScreenUtil().setWidth(190));
  static final Widget hGap267 = SizedBox(width: ScreenUtil().setWidth(267));
  static final Widget hGap437 = SizedBox(width: ScreenUtil().setWidth(437));

  /// 垂直间隔
  static final Widget vGap4 = SizedBox(height: ScreenUtil().setHeight(4));
  static final Widget vGap5 = SizedBox(height: ScreenUtil().setHeight(5));
  static final Widget vGap8 = SizedBox(height: ScreenUtil().setHeight(8));
  static final Widget vGap10 = SizedBox(height: ScreenUtil().setHeight(10));
  static final Widget vGap12 = SizedBox(height: ScreenUtil().setHeight(12));
  static final Widget vGap15 = SizedBox(height: ScreenUtil().setHeight(15));
  static final Widget vGap16 = SizedBox(height: ScreenUtil().setHeight(16));
  static final Widget vGap20 = SizedBox(height: ScreenUtil().setHeight(20));
  static final Widget vGap26 = SizedBox(height: ScreenUtil().setHeight(26));
  static final Widget vGap27 = SizedBox(height: ScreenUtil().setHeight(27));
  static final Widget vGap30 = SizedBox(height: ScreenUtil().setHeight(30));
  static final Widget vGap32 = SizedBox(height: ScreenUtil().setHeight(32));
  static final Widget vGap40 = SizedBox(height: ScreenUtil().setHeight(40));
  static final Widget vGap42 = SizedBox(height: ScreenUtil().setHeight(42));
  static final Widget vGap50 = SizedBox(height: ScreenUtil().setHeight(50));
  static final Widget vGap55 = SizedBox(height: ScreenUtil().setHeight(55));
  static final Widget vGap60 = SizedBox(height: ScreenUtil().setHeight(60));
  static final Widget vGap70 = SizedBox(height: ScreenUtil().setHeight(70));
  static final Widget vGap80 = SizedBox(height: ScreenUtil().setHeight(80));
  static final Widget vGap100 = SizedBox(height: ScreenUtil().setHeight(100));
  static final Widget vGap120 = SizedBox(height: ScreenUtil().setHeight(120));
  static final Widget vGap200 = SizedBox(height: ScreenUtil().setHeight(200));
  static final Widget vGap220 = SizedBox(height: ScreenUtil().setHeight(220));

  static Widget line = SizedBox(
    height: 0.6,
    width: double.infinity,
    child: DecoratedBox(decoration: BoxDecoration(color: Colours.line)),
  );

  static Widget empty = SizedBox();
}
