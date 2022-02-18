import 'package:flutter/material.dart';
import 'package:fluttertemplate/ui/widgets/appbar/custom_appbar.dart';

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
      appBar: CustomAppbar(title: "ThirdScreen"),
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return Center(child: Text("ThirdScreen"));
  }
}
