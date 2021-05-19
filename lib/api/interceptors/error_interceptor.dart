import 'package:connectivity/connectivity.dart' show Connectivity, ConnectivityResult;
import 'package:dio/dio.dart' show Dio, InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:logging/logging.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;
  final _log = Logger('Api - Interceptor - ErrorInterceptors');

  ErrorInterceptors(this._dio);

  @override
  onRequest(
    RequestOptions requestOptions,
    RequestInterceptorHandler handler,
  ) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      String tips = "网络异常，检查你的网络";
      _log.severe(tips);
      // return _dio.resolve(tips);
    }
    handler.next(requestOptions);
  }
}
