import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

/// 间隔
class Gaps {
  /// 水平间隔
  static final Widget hGap4 = SizedBox(width: 4.w);
  static final Widget hGap5 = SizedBox(width: 5.w);
  static final Widget hGap6 = SizedBox(width: 6.w);
  static final Widget hGap8 = SizedBox(width: 8.w);
  static final Widget hGap10 = SizedBox(width: 10.w);
  static final Widget hGap12 = SizedBox(width: 12.w);
  static final Widget hGap14 = SizedBox(width: 14.w);
  static final Widget hGap15 = SizedBox(width: 15.w);
  static final Widget hGap16 = SizedBox(width: 16.w);
  static final Widget hGap20 = SizedBox(width: 20.w);
  static final Widget hGap22 = SizedBox(width: 22.w);
  static final Widget hGap24 = SizedBox(width: 24.w);
  static final Widget hGap26 = SizedBox(width: 26.w);
  static final Widget hGap28 = SizedBox(width: 28.w);
  static final Widget hGap30 = SizedBox(width: 30.w);
  static final Widget hGap32 = SizedBox(width: 32.w);
  static final Widget hGap40 = SizedBox(width: 40.w);
  static final Widget hGap50 = SizedBox(width: 50.w);
  static final Widget hGap64 = SizedBox(width: 60.w);
  static final Widget hGap70 = SizedBox(width: 70.w);
  static final Widget hGap80 = SizedBox(width: 80.w);
  static final Widget hGap100 = SizedBox(width: 100.w);
  static final Widget hGap200 = SizedBox(width: 200.w);

  /// 垂直间隔
  static final Widget vGap4 = SizedBox(height: 4.h);
  static final Widget vGap5 = SizedBox(height: 5.h);
  static final Widget vGap8 = SizedBox(height: 8.h);
  static final Widget vGap10 = SizedBox(height: 10.h);
  static final Widget vGap12 = SizedBox(height: 12.h);
  static final Widget vGap15 = SizedBox(height: 15.h);
  static final Widget vGap16 = SizedBox(height: 16.h);
  static final Widget vGap20 = SizedBox(height: 20.h);
  static final Widget vGap26 = SizedBox(height: 26.h);
  static final Widget vGap27 = SizedBox(height: 27.h);
  static final Widget vGap30 = SizedBox(height: 30.h);
  static final Widget vGap40 = SizedBox(height: 40.h);
  static final Widget vGap50 = SizedBox(height: 50.h);
  static final Widget vGap60 = SizedBox(height: 60.h);
  static final Widget vGap70 = SizedBox(height: 70.h);
  static final Widget vGap80 = SizedBox(height: 80.h);
  static final Widget vGap200 = SizedBox(height: 200.h);

  static Widget line = SizedBox(
    height: 0.6,
    width: double.infinity,
    child: DecoratedBox(decoration: BoxDecoration(color: Colours.line)),
  );

  static Widget empty = SizedBox();
}
