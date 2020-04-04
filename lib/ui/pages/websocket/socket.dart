import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;

// 方案1 ：html 与 dart 使用 webview 通信，dart 再通过websocket与第三方模块通信
class SocketServer {
  static runSocket() async {
    var channel = IOWebSocketChannel.connect("ws://localhost:3300");

    print("启动监听端口：3300");
    channel.stream.listen((message) {
      channel.sink.add("received!");

      channel.stream.listen((message) {
        // ...
        print("监听信息$message");
      });

      channel.sink.close(status.goingAway);
    });
  }
}
