import 'package:flutter/material.dart';

class WidgetNotFound extends StatelessWidget {
  const WidgetNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("not found"),
      ),
      body: const Text('not found'),
    );
  }
}
