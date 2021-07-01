import 'package:flutter/material.dart';
import 'package:template/core/constants/app_theme.dart';
import 'package:template/ui/component/title_view.dart';

class ForthScreen extends StatefulWidget {
  @override
  _ForthScreenState createState() => _ForthScreenState();
}

class _ForthScreenState extends State<ForthScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(child: Text("Forth Screen"),)
      ),
    );
  }
}
