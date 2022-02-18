import 'package:flutter/material.dart';
import 'package:fluttertemplate/ui/widgets/appbar/custom_appbar.dart';

class ForthScreen extends StatefulWidget {
  @override
  _ForthScreenState createState() => _ForthScreenState();
}

class _ForthScreenState extends State<ForthScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "ForthScreen"),
      backgroundColor: Colors.transparent,
      body: Center(child: Text("ForthScreen")),
    );
  }
}
