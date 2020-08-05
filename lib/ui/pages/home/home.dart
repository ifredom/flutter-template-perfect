import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';
import 'package:template/ui/pages/home/config_view_model.dart';
import 'package:template/ui/pages/home/home_view_model.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/locator.dart';
import 'package:provider_architecture/provider_widget.dart';
import 'package:provider_architecture/viewmodel_provider.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _configViewModel = locator<ConfigViewModel>();

  @override
  void initState() {
    super.initState();

    // _configViewModel.intPlayer(); //初始化背景音乐播放器
  }

  @override
  void dispose() {
    _configViewModel.disposePlayer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withoutConsumer(
      viewModel: HomeViewModel(),
      // 以登录状态下，需要请求用户数据
      onModelReady: (model) async => model.initialise(),
      builder: (context, model, child) => PlatformScaffold(
        body: BuildMainContent(),
      ),
    );
  }
}

// 此模式，保证home页面不会rebuild ,或者使用consume
class BuildMainContent extends ProviderWidget<HomeViewModel> {
  BuildMainContent({Key key}) : super(key: key, listen: false);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: ScreenUtil().setSp(32),
            left: 0,
            right: ScreenUtil().setSp(39),
            child: Text("topMenu"),
          ),
          Positioned(
            top: ScreenUtil().setSp(235),
            right: ScreenUtil().setSp(50),
            child: Text("topMenu"),
          ),
          Positioned(
              bottom: ScreenUtil().setSp(36),
              right: ScreenUtil().setSp(50),
              child: Row(
                children: <Widget>[
                  Text("menuOne"),
                  Gaps.hGap10,
                  Text("menuTwo")
                ],
              )),
        ],
      ),
    );
  }
}

class BuildAudioPlayer extends ProviderWidget<HomeViewModel> {
  final String url;
  final FijkPlayer player;

  BuildAudioPlayer({
    Key key,
    this.url = "asset:///assets/audio/bgaudio.mp3",
    this.player,
  }) : super(key: key, listen: false);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return FijkView(
      player: player,
    );
  }
}
