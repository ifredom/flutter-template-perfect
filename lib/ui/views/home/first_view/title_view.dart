import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/constants/app_theme.dart';

typedef CallbackFunction = void Function();

class TitleView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final CallbackFunction? callback;
  final AnimationController? animationController;
  final Animation? animation;
  TitleView({Key? key, this.titleTxt = "", this.subTxt = "", this.callback, this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget resultBuilder;
    Widget contentBuilder = Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                titleTxt,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: AppTheme.fontName,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  letterSpacing: 0.5,
                  color: AppTheme.lightText,
                ),
              ),
            ),
            InkWell(
              highlightColor: Colors.transparent,
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
              onTap: () {
                this.callback!();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  children: <Widget>[
                    Text(
                      subTxt,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontFamily: AppTheme.fontName,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                        letterSpacing: 0.5,
                        color: AppTheme.nearlyDarkBlue,
                      ),
                    ),
                    SizedBox(
                      height: 38,
                      width: 26,
                      child: Icon(
                        Icons.arrow_forward,
                        color: AppTheme.darkText,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );

    // 是否运用动画
    if (animation != null) {
      resultBuilder = AnimatedBuilder(
        animation: animationController as AnimationController,
        builder: (BuildContext context, Widget? child) {
          return FadeTransition(
            opacity: animation as Animation<double>,
            child: Transform(
                transform: Matrix4.translationValues(0.0, 30 * (1.0 - animation?.value), 0.0), child: contentBuilder),
          );
        },
      );
    } else {
      resultBuilder = contentBuilder;
    }

    return resultBuilder;
  }
}
