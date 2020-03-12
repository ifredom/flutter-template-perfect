import 'package:dio/dio.dart' show Dio, InterceptorsWrapper, RequestOptions;
// 该插件允许Flutter应用发现网络连接并进行相应配置。它可以区分蜂窝连接和WiFi连接。该插件适用于iOS和Android。
import 'package:connectivity/connectivity.dart'
    show Connectivity, ConnectivityResult;
import '../code.dart' show Code;
import '../result_data.dart' show ResultData;

class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(new ResultData(
        Code.errorHandleFunction(Code.NETWORK_ERROR, '', false),
        false,
        Code.NETWORK_ERROR,
      ));
    }
    return options;
  }
}
