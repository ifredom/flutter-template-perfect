import 'package:flutter/material.dart';
import 'package:quiver/iterables.dart';

class NoKeyWidget extends StatefulWidget {
  const NoKeyWidget({Key? key}) : super(key: key);

  @override
  _NoKeyWidgetState createState() => _NoKeyWidgetState();
}

class _NoKeyWidgetState extends State<NoKeyWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // BoxWidget(
            //   Colors.green,
            //   key: ValueKey(1),
            // ),
            BoxWidget(
              Colors.red,
              key: ValueKey(2),
            ),
            BoxWidget(
              Colors.yellow,
              key: ValueKey(3),
            ),
            TextButton(
              onPressed: () {
                count++;
              },
              child: Text("count"),
            ),
          ],
        ),
      ),
    );
  }
}

class BoxWidget extends StatefulWidget {
  final Color color;
  const BoxWidget(this.color, {Key? key}) : super(key: key);

  @override
  _BoxWidgetState createState() => _BoxWidgetState();
}

class _BoxWidgetState extends State<BoxWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 100,
        color: widget.color,
        child: Text(count.toString()),
      ),
      onTap: () {
        count++;
        setState(() {});
      },
    );
  }
}
