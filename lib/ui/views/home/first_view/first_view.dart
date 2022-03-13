import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fluttertemplate/core/constants/app_theme.dart';
import 'package:fluttertemplate/ui/views/home/first_view/title_view.dart';

import 'package:fluttertemplate/core/app/app.locator.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key, required this.animationController}) : super(key: key);

  final AnimationController animationController;
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> with TickerProviderStateMixin {
  final _navigationService = locator<NavigationService>();
  late Animation<double> topBarAnimation;

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 && scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
    const int count = 5;
    listViews.add(
      TitleView(
        titleTxt: '油闷大虾',
        subTxt: '北京大酒店',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController, curve: Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        callback: () {
          Map post = Map();
          post["title"] = "油闷大虾";
          post["description"] = "油焖大虾是山东省的一道特色名菜，属于鲁菜，使用鲁菜特有的油焖技法。";

          _navigationService.navigateTo(Routes.productDetailView, arguments: ProductDetailViewArguments(post: post));
        },
      ),
    );

    listViews.add(
      TitleView(
        titleTxt: '水煮肉片',
        subTxt: '花园大酒店',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController, curve: Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        callback: () {
          Map post = Map();
          post["title"] = "水煮肉片";
          post["description"] = "水煮肉片是以猪里脊肉为主料的一道地方新创名菜，起源于自贡";

          _navigationService.navigateTo(Routes.productDetailView, arguments: ProductDetailViewArguments(post: post));
        },
      ),
    );
    listViews.add(
      TitleView(
        titleTxt: '啤酒鸭',
        subTxt: '民宿',
        animation: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
            parent: widget.animationController, curve: Interval((1 / count) * 4, 1.0, curve: Curves.fastOutSlowIn))),
        animationController: widget.animationController,
        callback: () {
          Map post = Map();
          post["title"] = "啤酒鸭";
          post["description"] = "啤酒鸭是一道以鸭子、啤酒为主料的特色佳肴，据传起源于清代";

          _navigationService.navigateTo(Routes.productDetailView, arguments: ProductDetailViewArguments(post: post));
        },
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 10));
    return Future.value(true);
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
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height + MediaQuery.of(context).padding.top + 24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }
}
