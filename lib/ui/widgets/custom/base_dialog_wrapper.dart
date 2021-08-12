import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertemplate/core/utils/common/color_utils.dart';
import 'package:fluttertemplate/core/utils/res/gaps.dart';
import 'package:fluttertemplate/ui/widgets/buttons/gradient_button.dart';

class BaseDialogWrapper extends Dialog {
  final Widget child;
  final String title;
  final double? height;
  final double? width;
  final bool showClose;
  final VoidCallback? onDenied;
  final VoidCallback? onConfirmed;
  final VoidCallback? onClosed;
  final String deniedButtonText;
  final String confirmedButtonText;

  BaseDialogWrapper({
    Key? key,
    required this.child,
    this.title = '提示',
    this.width,
    this.height,
    this.showClose = true,
    this.onDenied,
    this.onConfirmed,
    this.onClosed,
    this.deniedButtonText = '取消',
    this.confirmedButtonText = '确认',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      ///背景透明
      color: Colors.transparent,
      child: Center(
        child: Container(
          width: width ?? double.infinity,
          height: height ?? double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              width: 5,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          constraints: BoxConstraints(
            minWidth: 0.48.w,
            minHeight: 0.48.h,
            maxWidth: 0.9,
            maxHeight: 0.9.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BuildTopAreaWidget(title: this.title, showCloseButton: showClose, onClosed: this.onClosed!),
              Expanded(flex: 1, child: this.child),
              BuildActionsButton(
                onDenied: onDenied,
                onConfirmed: onConfirmed,
                deniedButtonText: deniedButtonText,
                confirmedButtonText: confirmedButtonText,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildTopAreaWidget extends StatelessWidget {
  final String title;
  final bool showCloseButton;
  final Function? onClosed;
  BuildTopAreaWidget({this.title = '提示', this.showCloseButton = true, this.onClosed});
  @override
  Widget build(BuildContext context) {
    Widget buildTitle = Container(
      width: double.infinity,
      child: Center(
        child: Text(
          title,
          style: TextStyle(color: HexToColor('#5324B3'), fontWeight: FontWeight.bold, fontSize: ScreenUtil().setSp(32)),
        ),
      ),
    );

    Widget buildCloseButton = showCloseButton
        ? Positioned(
            top: 0,
            right: 0,
            child: GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  'assets/images/custom/close@2x.png',
                  fit: BoxFit.fitWidth,
                  width: ScreenUtil().setHeight(24),
                  height: ScreenUtil().setHeight(24),
                ),
              ),
              onTap: () {
                if (onClosed != null) {
                  onClosed!();
                } else {
                  // locator<NavigationService>().pop();
                  Navigator.pop(context);
                }
              },
            ),
          )
        : Gaps.empty;
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(16), horizontal: ScreenUtil().setWidth(24)),
      decoration: BoxDecoration(
        color: HexToColor('#F7F2FF'),
        borderRadius: BorderRadius.vertical(top: Radius.elliptical(16, 16)),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[buildTitle, buildCloseButton],
      ),
    );
  }
}

class BuildActionsButton extends StatelessWidget {
  final VoidCallback? onDenied;
  final VoidCallback? onConfirmed;
  final String deniedButtonText;
  final String confirmedButtonText;

  BuildActionsButton(
      {Key? key, this.onDenied, this.onConfirmed, this.deniedButtonText = '取消', this.confirmedButtonText = '确认'})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget buttonWidget;
    if (onDenied != null && onConfirmed != null) {
      buttonWidget = Padding(
        padding: EdgeInsets.all(
          ScreenUtil().setHeight(40),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            GradientButton(
              colors: [HexToColor('#C7B8E6')],
              text: deniedButtonText,
              onPressed: () {
                if (onDenied != null) {
                  onDenied!();
                }
              },
            ),
            GradientButton(
              text: confirmedButtonText,
              colors: [HexToColor('#FF696A'), HexToColor('#FF894A')],
              onPressed: () {
                if (onDenied != null) {
                  onConfirmed!();
                }
              },
            ),
          ],
        ),
      );
    } else if (onDenied != null && onConfirmed == null) {
      buttonWidget = Center(
        child: Padding(
          padding: EdgeInsets.all(
            ScreenUtil().setHeight(40),
          ),
          child: GradientButton(
            colors: [HexToColor('#C7B8E6')],
            text: deniedButtonText,
            onPressed: () {
              if (onDenied != null) {
                onDenied!();
              }
            },
          ),
        ),
      );
    } else if (onDenied == null && onConfirmed != null) {
      buttonWidget = Center(
        child: Padding(
          padding: EdgeInsets.all(
            ScreenUtil().setHeight(40),
          ),
          child: GradientButton(
            text: confirmedButtonText,
            colors: [HexToColor('#FF696A'), HexToColor('#FF894A')],
            onPressed: () {
              if (onDenied != null) {
                onConfirmed!();
              }
            },
          ),
        ),
      );
    } else {
      buttonWidget = Gaps.empty;
    }
    return buttonWidget;
  }
}
