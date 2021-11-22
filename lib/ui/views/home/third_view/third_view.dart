import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/utils/piano/piano_view.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  double get keyWidth => 80 + (80 * _widthRatio);
  double _widthRatio = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("piano"),
      ),
      body: _buildKeys(context),
    );
  }

  Widget _buildKeys(BuildContext context) {
    double keyWidth = 40 + (80 * 0.5);

    if (MediaQuery.of(context).size.height > 600) {
      return Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Flexible(
            child: PianoView(
              keyWidth: keyWidth,
              showLabels: true,
              labelsOnlyOctaves: false,
              disableScroll: false,
              thumbnail: true,
            ),
          ),
          // Flexible(
          //   child: PianoView(
          //     keyWidth: keyWidth,
          //     showLabels: false,
          //     labelsOnlyOctaves: false,
          //     disableScroll: false,
          //   ),
          // ),
        ],
      );
    }
    return Container();
  }
}
