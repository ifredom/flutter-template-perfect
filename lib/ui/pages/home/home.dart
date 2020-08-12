import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/constants/app_theme.dart';
import 'package:template/core/constants/tab_icon_data.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/ui/pages/acomview/bottom_bar_view.dart';
import 'package:template/ui/pages/first_view/first_view.dart';
import 'package:template/ui/pages/home/config_view_model.dart';
import 'package:template/ui/pages/home/home_view_model.dart';
import 'package:template/ui/pages/second_view/second_view.dart';

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
    // _homeViewModel.intPlayer(); // 初始化背景音乐播放器
  }

  @override
  void dispose() {
    animationController.dispose();
    // _configViewModel.disposePlayer();
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
      )),
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
            if (index == 0 || index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = FirstScreen(animationController: animationController);
                });
              });
            } else if (index == 1 || index == 3) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody = SecondScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
