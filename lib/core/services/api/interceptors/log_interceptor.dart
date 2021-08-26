import 'package:dio/dio.dart'
    show
        DioError,
        ErrorInterceptorHandler,
        InterceptorsWrapper,
        RequestInterceptorHandler,
        RequestOptions,
        Response,
        ResponseInterceptorHandler;
import 'package:fluttertemplate/core/app/app.logger.dart';
import 'package:fluttertemplate/core/constants/constants.dart';

bool openDebug = Constants.DEBUG;

class LogsInterceptors extends InterceptorsWrapper {
  final _log = getLogger('Api - LogsInterceptors');

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (openDebug) {
      if (options.data != null) {
        _log.i('request params: ${options.data.toString()} \r\n');
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (openDebug) {
      _log.i('response: ${response.toString()} \r\n');
    }
    return super.onResponse(response, handler);
  }

  @override
  onError(DioError err, ErrorInterceptorHandler handler) async {
    if (openDebug) {
      _log.e('request error info: ${err.response?.toString() ?? ""}');
    }
    return super.onError(err, handler);
  }
}
