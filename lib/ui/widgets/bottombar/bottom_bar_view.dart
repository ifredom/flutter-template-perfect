import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/constants/app_theme.dart';
import 'package:fluttertemplate/ui/widgets/bottombar/tab_icon_data.dart';
import 'package:fluttertemplate/core/utils/common/color_utils.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView({super.key, required this.tabIconsList, required this.changeIndex, required this.addClick});

  final Function(int index) changeIndex;
  final Function addClick;
  final List<TabIconData> tabIconsList;
  @override
  BottomBarViewState createState() => BottomBarViewState();
}

class BottomBarViewState extends State<BottomBarView> with SingleTickerProviderStateMixin {
  late AnimationController animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..forward();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Column(
          children: <Widget>[
            SizedBox(
              height: 62,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TabIcons(
                          tabIconData: widget.tabIconsList[0],
                          removeAllSelect: () {
                            setRemoveAllSelection(widget.tabIconsList[0]);
                            widget.changeIndex(0);
                          }),
                    ),
                    Expanded(
                      child: TabIcons(
                          tabIconData: widget.tabIconsList[1],
                          removeAllSelect: () {
                            setRemoveAllSelection(widget.tabIconsList[1]);
                            widget.changeIndex(1);
                          }),
                    ),
                    SizedBox(
                      width: Tween<double>(begin: 0.0, end: 1.0)
                              .animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn))
                              .value *
                          64.0,
                    ),
                    Expanded(
                      child: TabIcons(
                          tabIconData: widget.tabIconsList[2],
                          removeAllSelect: () {
                            setRemoveAllSelection(widget.tabIconsList[2]);
                            widget.changeIndex(2);
                          }),
                    ),
                    Expanded(
                      child: TabIcons(
                          tabIconData: widget.tabIconsList[3],
                          removeAllSelect: () {
                            setRemoveAllSelection(widget.tabIconsList[3]);
                            widget.changeIndex(3);
                          }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: SizedBox(
            width: 38 * 2.0,
            height: 38 + 62.0,
            child: Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              child: SizedBox(
                width: 38 * 2.0,
                height: 38 * 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0)
                        .animate(CurvedAnimation(parent: animationController, curve: Curves.fastOutSlowIn)),
                    child: Container(
                      // alignment: Alignment.center,s
                      decoration: BoxDecoration(
                        color: AppTheme.nearlyDarkBlue,
                        gradient: LinearGradient(colors: [
                          AppTheme.nearlyDarkBlue,
                          HexToColor('#6A88E5'),
                        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: AppTheme.nearlyDarkBlue.withOpacity(0.4),
                              offset: const Offset(8.0, 16.0),
                              blurRadius: 16.0),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white.withOpacity(0.1),
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: () {
                            widget.addClick();
                          },
                          child: const Icon(
                            Icons.add,
                            color: AppTheme.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void setRemoveAllSelection(TabIconData tabIconData) {
    if (!mounted) return;
    setState(() {
      for (var tab in widget.tabIconsList) {
        tab.isSelected = false;
        if (tabIconData.index == tab.index) {
          tab.isSelected = true;
        }
      }
    });
  }
}

class TabIcons extends StatefulWidget {
  final TabIconData tabIconData;
  final Function removeAllSelect;
  const TabIcons({super.key, required this.tabIconData, required this.removeAllSelect});

  @override
  TabIconsState createState() => TabIconsState();
}

class TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.tabIconData.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          widget.removeAllSelect();
          widget.tabIconData.animationController?.reverse();
        }
      });
    super.initState();
  }

  void setAnimation() {
    widget.tabIconData.animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            if (!widget.tabIconData.isSelected) {
              setAnimation();
            }
          },
          child: IgnorePointer(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.88, end: 1.0).animate(CurvedAnimation(
                      parent: widget.tabIconData.animationController as AnimationController,
                      curve: const Interval(0.1, 1.0, curve: Curves.fastOutSlowIn))),
                  child: Image.asset(widget.tabIconData.isSelected
                      ? widget.tabIconData.selectedImagePath
                      : widget.tabIconData.imagePath),
                ),
                Positioned(
                  top: 4,
                  left: 6,
                  right: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: widget.tabIconData.animationController as AnimationController,
                        curve: const Interval(0.2, 1.0, curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 6,
                  bottom: 8,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: widget.tabIconData.animationController as AnimationController,
                        curve: const Interval(0.5, 0.8, curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: AppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 8,
                  bottom: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: widget.tabIconData.animationController as AnimationController,
                        curve: const Interval(0.5, 0.6, curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: AppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
