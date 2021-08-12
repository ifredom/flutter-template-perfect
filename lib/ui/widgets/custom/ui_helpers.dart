import 'dart:ui';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/utils/res/colors.dart';

class ScalingHelper {
  ScalingHelper({this.width: 750});

  // width of the current device
  double width;

  // scale
  double get scale => _scale;
  set scale(v) {
    _scale = v;
  }

  // default scale set to 1.0
  double _scale = 1.0;

  double size(double value) {
    return this._t(value) / window.devicePixelRatio;
  }

  EdgeInsets fromLTRB(double left, double top, double right, double bottom) {
    return EdgeInsets.fromLTRB(size(left), size(top), size(right), size(bottom));
  }

  EdgeInsets all(double value) {
    return EdgeInsets.all(size(value));
  }

  EdgeInsets only({double left = 0.0, double top = 0.0, double right = 0.0, double bottom = 0.0}) {
    return EdgeInsets.only(
      left: size(left),
      top: size(top),
      right: size(right),
      bottom: size(bottom),
    );
  }

  double _t(double value) {
    if (value > -1e-6 && value < 1e-6) {
      return value;
    }
    // Adapt small ones for landscape
    double devWidth = min(window.physicalSize.width, window.physicalSize.height);

    double s = devWidth / this.width;

    var r = value * s;

    return r * scale;
  }
}

class UIHelpers {
  double? width;
  double? height;

  //block sizes that change according to ui
  double? blockSizeHorizontal;
  double? blockSizeVertical;

  // An Utility tool to help scale things better.
  ScalingHelper? scalingHelper;

  // Text Styles
  TextStyle? heading;
  TextStyle? subheading;
  TextStyle? button;

  //Vertical Spaces that change accordingly
  SizedBox? verticalSpaceLow;
  SizedBox? verticalSpaceMedium;
  SizedBox? verticalSpaceHigh;

  //Horizontal Spaces that change accordingly
  SizedBox? horizontalSpaceLow;
  SizedBox? horizontalSpaceMedium;
  SizedBox? horizontalSpaceHigh;

  UIHelpers.fromContext(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    width = mediaQuery.size.width;
    height = mediaQuery.size.height;

    scalingHelper = ScalingHelper(width: width!);

    heading = Theme.of(context).textTheme.headline5!.copyWith(color: Colours.textPrimary, fontWeight: FontWeight.w800);

    //subheading = Theme.of(context).textTheme.headline6!.copyWith(
    //         color: AppColors.textSecondary, fontWeight: FontWeight.normal);

    subheading = TextStyle(
        fontWeight: FontWeight.w500,
        fontFamily: 'AppFont',
        color: Colours.textSecondary,
        fontSize: scalingHelper!.size(18));

    button = TextStyle(fontWeight: FontWeight.w600, fontFamily: 'AppFont', fontSize: scalingHelper!.size(16));

    blockSizeHorizontal = width! / 100;
    blockSizeVertical = height! / 100;

    verticalSpaceLow = SizedBox(
      height: blockSizeVertical! * 3,
    );
    verticalSpaceMedium = SizedBox(
      height: blockSizeVertical! * 5,
    );
    verticalSpaceHigh = SizedBox(
      height: blockSizeVertical! * 10,
    );

    horizontalSpaceLow = SizedBox(
      width: blockSizeHorizontal! * 3,
    );
    horizontalSpaceMedium = SizedBox(
      width: blockSizeHorizontal! * 7,
    );
    horizontalSpaceHigh = SizedBox(
      width: blockSizeHorizontal! * 11,
    );
  }
}
