import 'package:flutter/material.dart';
import 'package:fluttertemplate/ui/widgets/appbar/custom_appbar.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  ThirdScreenState createState() => ThirdScreenState();
}

class ThirdScreenState extends State<ThirdScreen> {
  double get keyWidth => 80 + (80 * _widthRatio);
  final double _widthRatio = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "ThirdScreen"),
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return const Center(child: Text("ThirdScreen"));
  }
}
