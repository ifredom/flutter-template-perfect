import 'package:flutter/material.dart';

///这个组件用来重新加载整个child Widget的。当我们需要重启APP的时候，可以使用这个方案
///https://stackoverflow.com/questions/50115311/flutter-how-to-force-an-application-restart-in-production-mode
class RestartManager extends StatefulWidget {
  final Widget child;

  RestartManager({Key? key, required this.child}) : super(key: key);

  static restartApp(BuildContext context) {
    // https://stackoverflow.com/questions/59448102/ancestorstateoftype-is-deprecated-use-findancestorstateoftype-instead

    final _RestartWidgetState state = context.findAncestorStateOfType<State<RestartManager>>();
      // final _RestartWidgetState state  = context.ancestorStateOfType(const RestartManager());


    state.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartManager> {
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
