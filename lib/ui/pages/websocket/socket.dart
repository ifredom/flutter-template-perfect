import 'package:web_socket_channel/io.dart';

class WebSocket {
  static String targetUrl = "ws://33.99.94.189:80/webSocket";

  IOWebSocketChannel channel;

  factory WebSocket() => _socketServer();
  static WebSocket _instance;
  // 构造函数
  WebSocket._() {
    // 初始化webSocket路由
  }
  static WebSocket _socketServer() {
    if (_instance == null) {
      _instance = WebSocket._();
    }
    return _instance;
  }

  Future<IOWebSocketChannel> create({String url}) async {
    channel = IOWebSocketChannel.connect(targetUrl);
    return channel;
  }

  static Future<void> listenSocketServe({IOWebSocketChannel channel}) async {
    channel.stream.listen((message) {
      // ...
      print("监听信息$message");
    });
  }

  void sendMessage(dynamic message) => channel.sink.add(message);
  void close() => channel.sink.close();
}
