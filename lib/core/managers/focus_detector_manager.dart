import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';

/// A Widget that will wrap all the managers into one widget
///   - to add another manager just wrap the widget
///     or add the new widget as a child of the current widget(s)
class FocusDetectorManager extends StatelessWidget {
  final Widget child;

  const FocusDetectorManager({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      key: UniqueKey(),

      // child:child,

      child: Scaffold(
        appBar: AppBar(
          title: Text('FocusDetector 示例'),
        ),
      ),
      onFocusGained: () {
        print('Focus gained, equivalent to onResume or viewDidAppear');
      },
      onFocusLost: () {
        print('Focus lost, equivalent to onPause or viewDidDisappear');
      },
    );
  }
}
