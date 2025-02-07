import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  RegisterViewState createState() => RegisterViewState();
}

class RegisterViewState extends State<RegisterView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Register"),
    );
  }
}
