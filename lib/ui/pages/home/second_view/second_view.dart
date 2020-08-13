import 'package:flutter/material.dart';
import 'package:template/core/constants/app_theme.dart';
import 'package:template/ui/component/title_view.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> with TickerProviderStateMixin {
  Animation<double> topBarAnimation;

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
            getMainListViewUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return listViews[index];
            },
          );
        }
      },
    );
  }
}
