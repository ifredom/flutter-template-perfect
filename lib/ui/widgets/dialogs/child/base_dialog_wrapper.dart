import 'package:flutter/material.dart';

import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/locator.dart';

class BaseDialogWrapper extends StatelessWidget {
  final Widget child;
  final String title;
  final double height;
  final double width;

  BaseDialogWrapper({
    Key key,
    @required this.child,
    this.title,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        ///背景透明
        color: Colors.transparent,
        child: Container(
          width: width ?? MediaQuery.of(context).size.width * 0.638,
          height: height ?? MediaQuery.of(context).size.height * 0.6783333,
          constraints: BoxConstraints(
            // minHeight: MediaQuery.of(context).size.height * 0.433333,
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          decoration: new BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color.fromRGBO(0, 0, 0, 0.2),
              width: 5,
            ),
            borderRadius: BorderRadius.circular(20),
            // 生成俩层阴影，一层绿，一层黄， 阴影位置由offset决定,
            // 阴影模糊层度由blurRadius大小决定（大就更透明更扩散），阴影模糊大小由spreadRadius决定
            // boxShadow: [
            //   BoxShadow(
            //       color: Color(0x99FFFF00),
            //       offset: Offset(5.0, 5.0),
            //       blurRadius: 10.0,
            //       spreadRadius: 2.0),
            //   BoxShadow(color: Color(0x9900FF00), offset: Offset(1.0, 1.0)),
            //   BoxShadow(
            //     color: Color(0xFF0000FF),
            //   )
            // ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setHeight(20),
                      horizontal: ScreenUtil().setWidth(50)),
                  decoration: new BoxDecoration(
                    color: HexToColor('#F7F2FF'),
                    border: Border.all(
                        color: Colors.transparent, width: 0.5), // 边色与边宽度
                    borderRadius:
                        BorderRadius.vertical(top: Radius.elliptical(16, 16)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Gaps.empty,
                      Text(
                        title,
                        style: TextStyle(
                            color: HexToColor('#5324B3'),
                            fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        child: Image.asset(
                          'assets/images/custom/close@2x.png',
                          fit: BoxFit.fitWidth,
                          width: ScreenUtil().setHeight(34),
                          height: ScreenUtil().setHeight(34),
                        ),
                        onTap: () {
                          locator<NavigationService>().pop();
                        },
                      )
                    ],
                  ),
                ),
                child
              ],
            ),
          ),
        ),
      ),
    );
  }
}
