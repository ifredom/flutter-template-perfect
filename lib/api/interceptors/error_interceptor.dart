import 'package:dio/dio.dart' show Dio, InterceptorsWrapper, RequestOptions;
// 该插件允许Flutter应用发现网络连接并进行相应配置。它可以区分蜂窝连接和WiFi连接。该插件适用于iOS和Android。
import 'package:connectivity/connectivity.dart' show Connectivity, ConnectivityResult;
import 'package:logging/logging.dart';
import '../common/code.dart' show Code;
import '../common/result_data.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;
  final _log = Logger('Api - Interceptor - ErrorInterceptors');

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      String tips = "网络异常，检查你的网络";
      _log.severe(tips);
      return _dio.resolve(tips);
    }
    return options;
  }
}
