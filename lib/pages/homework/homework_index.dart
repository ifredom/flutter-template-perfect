import 'package:flutter/material.dart';

class HomeworkIndex extends StatefulWidget {
  @override
  _HomeworkIndexState createState() => _HomeworkIndexState();
}

class _HomeworkIndexState extends State<HomeworkIndex> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(child: Text("HomeworkIndex page")),
      ),
    );
  }
}
