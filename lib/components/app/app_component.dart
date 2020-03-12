import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import 'package:chinaculture/pages/home/home.dart';
import 'package:oktoast/oktoast.dart';
import 'package:chinaculture/pages/user/login.dart';
import 'package:chinaculture/utils/res/dimens.dart';
import '../../routers/application.dart';
import '../../routers/routers.dart';
import '../../store/index.dart';
import '../../utils/common/colorUtils.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppComponent extends StatelessWidget {
  AppComponent({Key key}) : super(key: key);
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  final bool _isLoading = false;
  final bool _hasLogin = false;

  void initRoute() {
    final router = new Router();
    RoutesUtils.configureRoutes(router);
    // 这里设置项目环境
    Application.router = router;
  }

  _showWelcomePage(BuildContext context) {
    if (_isLoading) {
      return Text("加载进度指示器");
    } else {
      print("是否登录:$_hasLogin");
      // 判断是否已经登录
      if (_hasLogin) {
        return HomePage();
      } else {
        // return Browser();
        return LoginPage();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    /// 设置工具栏风格样式
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.transparent,
    //   statusBarIconBrightness: Brightness.dark,
    //   statusBarBrightness:
    //       Platform.isAndroid ? Brightness.dark : Brightness.light,
    //   systemNavigationBarColor: Colors.white,
    //   systemNavigationBarDividerColor: Colors.grey,
    //   systemNavigationBarIconBrightness: Brightness.dark,
    // ));

    /// 初始化路由
    initRoute();

    /// 统一主题风格
    ThemeData _theme = new ThemeData(
      primaryColor: HexToColor('#103580'),
      backgroundColor: HexToColor('#5A6275'),
      textTheme: TextTheme(
        //设置Material的默认字体样式
        body1: TextStyle(
          color: Colors.black,
          fontSize: Dimens.gap_dp14,
          fontFamily: 'PingFang SC', // 默认字体设为: 14px
        ),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFC91B3A),
        size: Dimens.gap_dp15, // 图标默认尺寸，设置为: 14*14 px
      ),
    );

    print('Root Rebuild: $context');

    return Store.init(
      context: context,
      child: OKToast(
        child: RestartWidget(
          child: MaterialApp(
            navigatorKey: navigatorKey,
            title: 'chinaculture',
            theme: _theme,
            home: _showWelcomePage(context),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Application.router.generator,
          ),
        ),
      ),
    );
  }
}

///这个组件用来重新加载整个child Widget的。当我们需要重启APP的时候，可以使用这个方案
///https://stackoverflow.com/questions/50115311/flutter-how-to-force-an-application-restart-in-production-mode
class RestartWidget extends StatefulWidget {
  final Widget child;

  RestartWidget({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  static restartApp(BuildContext context) {
    // https://stackoverflow.com/questions/59448102/ancestorstateoftype-is-deprecated-use-findancestorstateoftype-instead

    final _RestartWidgetState state =
        context.findAncestorStateOfType<State<RestartWidget>>();

    state.restartApp();
  }

  @override
  _RestartWidgetState createState() => _RestartWidgetState();
}

class _RestartWidgetState extends State<RestartWidget> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: key,
      child: widget.child,
    );
  }
}
