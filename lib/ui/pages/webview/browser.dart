import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// https://www.jianshu.com/p/91b4c615b2b4

class Browser extends StatefulWidget {
  @override
  _BrowserState createState() => _BrowserState();
}

class _BrowserState extends State<Browser> with WidgetsBindingObserver {
  AppLifecycleState appLifecycleState;
  InAppLocalhostServer localhostServer = InAppLocalhostServer();
  final MyInAppBrowser browser = MyInAppBrowser();
  InAppWebViewController webView;
  String url = "";
  double progress = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _initLocalServe();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("cliik $state");

    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // locator<NavigationService>().pop();
    }

    print("bend");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // localhostServer.close();
    super.dispose();
  }

  Future _initLocalServe() async {
    await localhostServer.start();
  }

  // Widget _buildWebview() {
  //   return SizedBox(
  //     width: 800,
  //     height: 600,
  //     child: WebView(
  //       //加载本地文件使用file://开头，网络的正常使用
  //       //file://xxxx/xxx/xxx/html
  //       initialUrl: "file://assets/webview/dist/index.html",
  //       // initialUrl: "http://www.baidu.com",
  //       javascriptMode: JavascriptMode.unrestricted,
  //       onPageFinished: (url) {},
  //       onWebViewCreated: (WebViewController controller) {},
  //     ),
  //   );

  //   return WebView(
  //   debuggingEnabled: true,
  //   initialUrl: "http://localhost:8080/assets/webview/dist/",
  //   javascriptMode: JavascriptMode.unrestricted,
  //   javascriptChannels: Set.from([
  //     JavascriptChannel(
  //         name: 'Print',
  //         onMessageReceived: (JavascriptMessage message) {
  //           //This is where you receive message from
  //           //javascript code and handle in Flutter/Dart
  //           //like here, the message is just being printed
  //           //in Run/LogCat window of android studio
  //           print(message.message);
  //         })
  //   ]),
  // );
  // }

  Widget _buildInappWebview() {
    return InAppWebView(
      initialUrl: "http://localhost:8080/assets/webview/dist/index.html",
      initialHeaders: {},
      initialOptions: InAppWebViewWidgetOptions(
        inAppWebViewOptions: InAppWebViewOptions(
          debuggingEnabled: true,
          // useShouldOverrideUrlLoading: true,
          // useOnLoadResource: true,
        ),
      ),
      shouldOverrideUrlLoading: (InAppWebViewController controller, String url) {},
      onWebViewCreated: (InAppWebViewController controller) {
        print("onWebViewCreated");
        webView = controller;
      },
      onLoadStart: (InAppWebViewController controller, String url) {
        print("onLoadStart: $url");
        setState(() {
          this.url = url;
        });
      },
      onLoadStop: (InAppWebViewController controller, String url) {
        print("onLoadStop: $url");
        setState(() {
          this.url = url;
        });
      },
      onProgressChanged: (InAppWebViewController controller, int progress) {
        print(progress / 100);
        setState(() {
          this.progress = progress / 100;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        locator<NavigationService>().pop();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("webview demo"),
        ),
        body: _buildInappWebview(),
      ),
    );
  }
}

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("\n\nBrowser Created!\n\n");
  }

  @override
  Future onLoadStart(String url) async {
    print("\n\nStarted $url\n\n");
  }

  @override
  Future onLoadStop(String url) async {
    print("\n\nStopped $url\n\n");
  }

  @override
  void onLoadError(String url, int code, String message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(int progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("\n\nBrowser closed!\n\n");
  }

  @override
  void shouldOverrideUrlLoading(String url) {
    print("\n\n override $url\n\n");
    this.webViewController.loadUrl(url: url);
  }

  @override
  void onLoadResource(LoadedResource response) {
    print("Started at: " +
        response.startTime.toString() +
        "ms ---> duration: " +
        response.duration.toString() +
        "ms " +
        response.url);
  }

  @override
  void onConsoleMessage(ConsoleMessage consoleMessage) {
    print("""
    console output:
      message: ${consoleMessage.message}
      messageLevel: ${consoleMessage.messageLevel.toValue()}
   """);
  }

  openUrl(String url) {
    this.open(
      url: "http://www.bus2school.vn/contactus",
      options: InAppBrowserClassOptions(
        inAppWebViewWidgetOptions: InAppWebViewWidgetOptions(
          inAppWebViewOptions: InAppWebViewOptions(
            useShouldOverrideUrlLoading: true,
            useOnLoadResource: true,
          ),
        ),
      ),
    );
  }
}
