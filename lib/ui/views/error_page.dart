import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

class ErrorPage extends StatefulWidget {
  final FlutterErrorDetails details;

  const ErrorPage(this.details, {super.key});

  @override
  ErrorPageState createState() => ErrorPageState();
}

class ErrorPageState extends State<ErrorPage> {
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
      color: const Color(0xFF24292E),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: width,
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(30),
            gradient: RadialGradient(
              tileMode: TileMode.mirror,
              radius: 0.1,
              colors: [
                Colors.white.withAlpha(10),
                const Color(0xFF24292E),
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(width / 2)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage("assets/images/ifredom.jpg"),
                width: 90.0,
                height: 90.0,
              ),
              const SizedBox(
                height: 11.0,
              ),
              const Material(
                color: Color(0xFF24292E),
                child: Text(
                  'Error Occur',
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    style: ButtonStyle(
                      textStyle: WidgetStateProperty.all(const TextStyle(
                        color: Color(0xFF24292E),
                      )),
                    ),
                    onPressed: _errorReport,
                    child: const Text('Report'),
                  ),
                  const SizedBox(
                    width: 40.0,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      textStyle: WidgetStateProperty.all(const TextStyle(
                        color: Colors.white,
                      )),
                    ),
                    onPressed: () {
                      locator<NavigationService>().back();
                    },
                    child: const Text('Back'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _errorReport() {
    String content = '${widget.details.exception.toString()}\n${widget.details.stack.toString()}';
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: Container(
              color: Colors.yellowAccent,
              child: Text(content),
            ),
          );
        });
  }
}
