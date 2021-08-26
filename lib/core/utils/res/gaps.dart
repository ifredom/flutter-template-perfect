import 'package:flutter/widgets.dart';

import 'colors.dart';

/// 间隔
class Gaps {
  /// 水平间隔
  static final Widget hGap4 = SizedBox(width: 4);
  static final Widget hGap5 = SizedBox(width: 5);
  static final Widget hGap6 = SizedBox(width: 6);
  static final Widget hGap8 = SizedBox(width: 8);
  static final Widget hGap10 = SizedBox(width: 10);
  static final Widget hGap12 = SizedBox(width: 12);
  static final Widget hGap14 = SizedBox(width: 14);
  static final Widget hGap15 = SizedBox(width: 15);
  static final Widget hGap16 = SizedBox(width: 16);
  static final Widget hGap20 = SizedBox(width: 20);
  static final Widget hGap22 = SizedBox(width: 22);
  static final Widget hGap24 = SizedBox(width: 24);
  static final Widget hGap26 = SizedBox(width: 26);
  static final Widget hGap28 = SizedBox(width: 28);
  static final Widget hGap30 = SizedBox(width: 30);
  static final Widget hGap32 = SizedBox(width: 32);
  static final Widget hGap40 = SizedBox(width: 40);
  static final Widget hGap50 = SizedBox(width: 50);
  static final Widget hGap64 = SizedBox(width: 60);
  static final Widget hGap70 = SizedBox(width: 70);
  static final Widget hGap80 = SizedBox(width: 80);
  static final Widget hGap100 = SizedBox(width: 100);
  static final Widget hGap200 = SizedBox(width: 200);

  /// 垂直间隔
  static final Widget vGap4 = SizedBox(height: 4);
  static final Widget vGap5 = SizedBox(height: 5);
  static final Widget vGap8 = SizedBox(height: 8);
  static final Widget vGap10 = SizedBox(height: 10);
  static final Widget vGap12 = SizedBox(height: 12);
  static final Widget vGap15 = SizedBox(height: 15);
  static final Widget vGap16 = SizedBox(height: 16);
  static final Widget vGap20 = SizedBox(height: 20);
  static final Widget vGap26 = SizedBox(height: 26);
  static final Widget vGap27 = SizedBox(height: 27);
  static final Widget vGap30 = SizedBox(height: 30);
  static final Widget vGap40 = SizedBox(height: 40);
  static final Widget vGap50 = SizedBox(height: 50);
  static final Widget vGap60 = SizedBox(height: 60);
  static final Widget vGap70 = SizedBox(height: 70);
  static final Widget vGap80 = SizedBox(height: 80);
  static final Widget vGap200 = SizedBox(height: 200);

  static Widget line = SizedBox(
    height: 0.6,
    width: double.infinity,
    child: DecoratedBox(decoration: BoxDecoration(color: Colours.line)),
  );

  static Widget empty = SizedBox();
}
