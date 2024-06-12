import 'package:flutter/widgets.dart';

import 'colors.dart';

/// 间隔
class Gaps {
  /// 水平间隔
  static const Widget hGap4 = SizedBox(width: 4);
  static const Widget hGap5 = SizedBox(width: 5);
  static const Widget hGap6 = SizedBox(width: 6);
  static const Widget hGap8 = SizedBox(width: 8);
  static const Widget hGap10 = SizedBox(width: 10);
  static const Widget hGap12 = SizedBox(width: 12);
  static const Widget hGap14 = SizedBox(width: 14);
  static const Widget hGap15 = SizedBox(width: 15);
  static const Widget hGap16 = SizedBox(width: 16);
  static const Widget hGap20 = SizedBox(width: 20);
  static const Widget hGap22 = SizedBox(width: 22);
  static const Widget hGap24 = SizedBox(width: 24);
  static const Widget hGap26 = SizedBox(width: 26);
  static const Widget hGap28 = SizedBox(width: 28);
  static const Widget hGap30 = SizedBox(width: 30);
  static const Widget hGap32 = SizedBox(width: 32);
  static const Widget hGap40 = SizedBox(width: 40);
  static const Widget hGap50 = SizedBox(width: 50);
  static const Widget hGap64 = SizedBox(width: 60);
  static const Widget hGap70 = SizedBox(width: 70);
  static const Widget hGap80 = SizedBox(width: 80);
  static const Widget hGap100 = SizedBox(width: 100);
  static const Widget hGap200 = SizedBox(width: 200);

  /// 垂直间隔
  static const Widget vGap4 = SizedBox(height: 4);
  static const Widget vGap5 = SizedBox(height: 5);
  static const Widget vGap8 = SizedBox(height: 8);
  static const Widget vGap10 = SizedBox(height: 10);
  static const Widget vGap12 = SizedBox(height: 12);
  static const Widget vGap15 = SizedBox(height: 15);
  static const Widget vGap16 = SizedBox(height: 16);
  static const Widget vGap20 = SizedBox(height: 20);
  static const Widget vGap26 = SizedBox(height: 26);
  static const Widget vGap27 = SizedBox(height: 27);
  static const Widget vGap30 = SizedBox(height: 30);
  static const Widget vGap40 = SizedBox(height: 40);
  static const Widget vGap50 = SizedBox(height: 50);
  static const Widget vGap60 = SizedBox(height: 60);
  static const Widget vGap70 = SizedBox(height: 70);
  static const Widget vGap80 = SizedBox(height: 80);
  static const Widget vGap200 = SizedBox(height: 200);

  static Widget line = const SizedBox(
    height: 0.6,
    width: double.infinity,
    child: DecoratedBox(decoration: BoxDecoration(color: Colours.line)),
  );

  static Widget empty = const SizedBox();
}
