import 'package:flutter/material.dart';

/*
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (_) => Popup(child: Text("123",style: TextStyle(color: Colors.white),),),
    );
 */
class PopRoute extends PopupRoute {
  final Duration _duration = Duration(milliseconds: 300);
  Widget child;

  PopRoute({required this.child});

  @override
  Color? get barrierColor => null;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return child;
  }

  @override
  Duration get transitionDuration => _duration;
}

class Popup extends StatelessWidget {
  final Widget child;
  final Function? onClick; //点击child事件

  Popup({
    required this.child,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Colors.transparent,
            ),
            Positioned(
              bottom: 0,
              child: GestureDetector(
                  child: child,
                  onTap: () {
                    //点击子child
                    if (onClick != null) {
                      Navigator.of(context).pop();
                      onClick!();
                    }
                  }),
            ),
          ],
        ),
        onTap: () {
          //点击空白处
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
