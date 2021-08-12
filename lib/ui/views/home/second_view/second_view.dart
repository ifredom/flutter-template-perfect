import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/constants/app_theme.dart';
import 'package:fluttertemplate/ui/views/home/first_view/title_view.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with TickerProviderStateMixin {
  late Animation<double> topBarAnimation;

  List<Widget> listViews = <Widget>[];

  @override
  void initState() {
    addAllListData();
    super.initState();
  }

  void addAllListData() {
    listViews.add(
      TitleView(titleTxt: 'Second Screen 数据 1', subTxt: 'Details 1'),
    );

    listViews.add(
      TitleView(titleTxt: 'Second Screen 数据 2', subTxt: 'Details 2'),
    );
    listViews.add(
      TitleView(titleTxt: 'Second Screen 数据 3', subTxt: 'Details 3'),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            testBetterFeedback(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget testBetterFeedback() {
    return TextButton(
        onPressed: () => {
              BetterFeedback.of(context).show((
                UserFeedback feedback,
              ) {
                // feedbackText, feedbackScreenshot).then((value) => BetterFeedback.of(context).hide();
              }),
            },
        child: Text('BetterFeedback'));
  }
}
