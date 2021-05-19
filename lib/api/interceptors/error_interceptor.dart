import 'package:connectivity/connectivity.dart' show Connectivity, ConnectivityResult;
import 'package:dio/dio.dart' show Dio, DioError, InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:logging/logging.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;
  final _log = Logger('Api - Interceptor - ErrorInterceptors');

  ErrorInterceptors(this._dio);

  // https://github.com/flutterchina/dio/blob/master/README-ZH.md
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      String tips = "网络异常，检查你的网络";
      _log.severe(tips);
      handler.reject(DioError(requestOptions: options, error: tips));
    }
    return super.onRequest(options, handler);
  }
}
