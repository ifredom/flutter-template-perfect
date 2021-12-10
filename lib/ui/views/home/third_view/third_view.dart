import 'package:flutter/material.dart';

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
      return Text("third");
    }
    return Container();
  }
}
