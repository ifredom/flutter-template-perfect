import 'package:flutter/material.dart';

///这个组件用来重新加载整个child Widget的。当我们需要重启APP的时候，可以使用这个方案
///https://stackoverflow.com/questions/50115311/flutter-how-to-force-an-application-restart-in-production-mode
class RestartManager extends StatefulWidget {
  final Widget child;

  const RestartManager({super.key, required this.child});

  static restartApp(BuildContext context) {
    // https://stackoverflow.com/questions/59448102/ancestorstateoftype-is-deprecated-use-findancestorstateoftype-instead

    final RestartWidgetState? state = context.findAncestorStateOfType<RestartWidgetState>();

    state!.restartApp();
  }

  @override
  RestartWidgetState createState() => RestartWidgetState();
}

class RestartWidgetState extends State<RestartManager> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}
