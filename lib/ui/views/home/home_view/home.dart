import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/constants/app_theme.dart';
import 'package:fluttertemplate/core/constants/tab_icon_data.dart';
import 'package:fluttertemplate/ui/views/home/first_view/first_view.dart';
import 'package:fluttertemplate/ui/views/home/forth_view/forth_view.dart';
import 'package:fluttertemplate/ui/views/home/home_view/home_view_model.dart';
import 'package:fluttertemplate/ui/views/home/second_view/second_view.dart';
import 'package:fluttertemplate/ui/views/home/third_view/third_view.dart';
import 'package:fluttertemplate/ui/widgets/bottombar/bottom_bar_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController animationController;

  late List<TabIconData> tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);

    tabIconsList = TabIconData.tabIconsList;

    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    tabBody = FirstScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("home build");
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          color: AppTheme.background,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: FutureBuilder<bool>(
              future: getData(),
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.hasData) {
                  return const SizedBox();
                } else {
                  return Stack(
                    children: <Widget>[
                      tabBody,
                      bottomBar(),
                    ],
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> getData() async {
    return Future.delayed(const Duration(milliseconds: 100)).then((value) => true);
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            animationController.reverse().then<dynamic>((data) {
              if (!mounted) {
                return;
              }
              switch (index) {
                case 0:
                  tabBody = FirstScreen(animationController: animationController);
                  break;
                case 1:
                  tabBody = SecondScreen();
                  break;
                case 2:
                  tabBody = ThirdScreen();
                  break;
                case 3:
                  tabBody = ForthScreen();
                  break;
                default:
              }
              setState(() {});
            });
          },
        ),
      ],
    );
  }
}
