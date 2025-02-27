import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/constants/app_theme.dart';
import 'package:fluttertemplate/ui/widgets/bottombar/tab_icon_data.dart';
import 'package:fluttertemplate/ui/views/home/first_view/first_view.dart';
import 'package:fluttertemplate/ui/views/home/forth_view/forth_view.dart';
import 'package:fluttertemplate/ui/views/home/home_view/home_view_model.dart';
import 'package:fluttertemplate/ui/views/home/second_view/second_view.dart';
import 'package:fluttertemplate/ui/views/home/third_view/third_view.dart';
import 'package:fluttertemplate/ui/widgets/bottombar/bottom_bar_view.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: AppTheme.background,
  );

  @override
  void initState() {
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
    print("home build");

    return ViewModelBuilder<HomeViewModel>.nonReactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
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
      ),
    );
  }

  Future<bool> getData() async {
    return Future.value(true);
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
                  tabBody = const SecondScreen();
                  break;
                case 2:
                  tabBody = const ThirdScreen();
                  break;
                case 3:
                  tabBody = const ForthScreen();
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
