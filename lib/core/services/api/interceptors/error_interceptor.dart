import 'package:connectivity_plus/connectivity_plus.dart' show Connectivity, ConnectivityResult;
import 'package:dio/dio.dart' show Dio, DioError, InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:fluttertemplate/core/app/app.logger.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  final _log = getLogger('Api - Interceptor - ErrorInterceptors');

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      String tips = "网络异常，检查你的网络";
      _log.e(tips);
      handler.reject(DioError(requestOptions: options, error: tips));
    }
    return super.onRequest(options, handler);
  }
}
