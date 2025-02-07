import 'package:flutter/material.dart';
import 'package:fluttertemplate/ui/widgets/appbar/custom_appbar.dart';

class ForthScreen extends StatefulWidget {
  const ForthScreen({super.key});

  @override
  ForthScreenState createState() => ForthScreenState();
}

class ForthScreenState extends State<ForthScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "ForthScreen"),
      backgroundColor: Colors.transparent,
      body: const Center(child: Text("ForthScreen")),
    );
  }
}
