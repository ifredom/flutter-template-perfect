import 'package:flutter/material.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';

import 'gradient_button.dart';

class CancelAndSureButton extends StatelessWidget {
  void _tappedCancel() async {
    print("点击取消");
  }

  void _tappedSure() async {}

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GradientButton(
          colors: [HexToColor('#C7B8E6')],
          text: "取消",
          onPressed: () {
            _tappedCancel();
          },
        ),
        GradientButton(
          text: '确定',
          colors: [HexToColor('#FF696A'), HexToColor('#FF894A')],
          onPressed: () {
            _tappedSure();
          },
        ),
      ],
    );
  }
}
