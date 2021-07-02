import 'package:connectivity/connectivity.dart' show Connectivity, ConnectivityResult;
import 'package:dio/dio.dart' show DioError, InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:dio/src/dio.dart';
import 'package:logging/logging.dart';

class ErrorInterceptors extends InterceptorsWrapper {
  final _log = Logger('Api - Interceptor - ErrorInterceptors');

  ErrorInterceptors(Dio dio);

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
