import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/constants/app_theme.dart';
import 'package:template/core/constants/tab_icon_data.dart';
import 'package:template/ui/component/bottom_bar_view.dart';
import 'package:template/ui/pages/home/first_view/first_view.dart';
import 'package:template/ui/pages/home/forth_view/forth_view.dart';
import 'package:template/ui/pages/home/home_view/home_view_model.dart';
import 'package:template/ui/pages/home/second_view/second_view.dart';
import 'package:template/ui/pages/home/third_view/third_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final _homeViewModel = locator<HomeViewModel>();

  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(duration: const Duration(milliseconds: 600), vsync: this);
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
    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => _homeViewModel,
      // onModelReady: (model) => model.initialise(),
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
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
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
