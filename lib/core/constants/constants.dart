class Constants {
  /// 保存的视频播放地址
  static const freeVideoUrl = 'http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4';

  /// http请求地址
  static const String BASE_URL = 'https://easy-mock.com/mock/59f69a7f70d0b32d6619db4e/user';

  /// 是否开启dio接口详细信息输出，以及其它相关插件调试信息
  static const bool DEBUG = true;

  /// 是否开启http代理
  static const bool useProxy = true;

  /// 是否开启反向代理的IP/域名地址 （前置条件：开启代理）
  static const String proxyAddress = "192.168.2.201:9003";

  /// appId
  static const String APP_ID = 'XT_WEB_CLIENT';

  /// appSecrect
  static const String APP_SECRET = 'XT_WEB_CLIENT_2019';

  /// 是否直接跳过闪屏页面，
  static const notSplash = false;

  /// 是否跳过引导页面
  static const isShowWelcome = false;
}
