import 'package:dio/dio.dart'
    show
        DioError,
        ErrorInterceptorHandler,
        InterceptorsWrapper,
        RequestInterceptorHandler,
        RequestOptions,
        Response,
        ResponseInterceptorHandler;
import 'package:logging/logging.dart';
import 'package:template/core/constants/constants.dart';

class LogsInterceptors extends InterceptorsWrapper {
  final _log = Logger('Api - LogsInterceptors');
  // static List
  @override
  onRequest(
    RequestOptions requestOptions,
    RequestInterceptorHandler handler,
  ) async {
    if (Constants.DEBUG) {
      _log.info('request url: ${requestOptions.path}');
      _log.info('request header: ${requestOptions.headers.toString()}');
      if (requestOptions.data != null) {
        _log.info('request params: ${requestOptions.data.toString()}');
      }
      print('\r\n');
    }
    return handler.next(requestOptions);
  }

  @override
  onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    if (Constants.DEBUG) {
      if (response != null) {
        _log.info('response: ${response.toString()}');
        print('\r\n');
      }
    }
    return Future.value(response);
  }

  @override
  onError(
    DioError error,
    ErrorInterceptorHandler handler,
  ) async {
    if (Constants.DEBUG) {
      _log.severe('request error info: ${error.response?.toString() ?? ""}');
    }
    handler.next(error);
  }
}
