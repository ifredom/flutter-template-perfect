import 'package:flutter/material.dart';
import 'package:template/core/utils/common/color_helper.dart';

import 'base_slider.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double progressValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return _buildSlider();
  }

  // SliderTheme 字段解释： https://blog.csdn.net/qq_33635385/article/details/100067702
  // slider 使用示例： https://www.jianshu.com/p/e51f660861a2
  Widget _buildSlider() {
    return SliderTheme(
      //自定义风格
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: HexToColor('#BFF184'), //进度条滑块左边颜色
        inactiveTrackColor: HexToColor('#BFF184'), //进度条滑块右边颜色
        trackShape: RoundSliderTrackShape(radius: 10), //进度条形状,这边自定义两头显示圆角
        thumbColor: Colors.yellow, //滑块颜色
        overlayColor: Colors.green, //滑块拖拽时外圈的颜色
        overlayShape: RoundSliderOverlayShape(
          //可继承SliderComponentShape自定义形状
          overlayRadius: 15, //滑块外圈大小
        ),
        thumbShape: RoundSliderThumbShape(
          //可继承SliderComponentShape自定义形状
          disabledThumbRadius: 15, //禁用是滑块大小
          enabledThumbRadius: 10, //滑块大小
        ),
        inactiveTickMarkColor: Colors.black,
        tickMarkShape: RoundSliderTickMarkShape(
          //继承SliderTickMarkShape可自定义刻度形状
          tickMarkRadius: 4.0, //刻度大小
        ),
        showValueIndicator: ShowValueIndicator.onlyForDiscrete, //气泡显示的形式
        valueIndicatorColor: Colors.red, //气泡颜色
        valueIndicatorShape: PaddleSliderValueIndicatorShape(), //气泡形状
        valueIndicatorTextStyle: TextStyle(color: Colors.black), //气泡里值的风格
        trackHeight: 15, //进度条宽度
      ),
      child: Slider(
        value: progressValue,
        onChanged: (v) {
          setState(() => progressValue = v);
        },
        label: "气泡:$progressValue", //气泡的值
        divisions: 10, //进度条上显示多少个刻度点
        max: 100,
        min: 0,
      ),
    );
  }
}
