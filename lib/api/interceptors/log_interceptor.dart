import 'package:dio/dio.dart' show InterceptorsWrapper, RequestOptions, Response, DioError;
import 'package:logging/logging.dart';
import 'package:template/core/constants/constants.dart';

class LogsInterceptors extends InterceptorsWrapper {
  final _log = Logger('Api - LogsInterceptors');
  // static List
  @override
  onRequest(RequestOptions options) async {
    if (Constants.DEBUG) {
      _log.info('request url: ${options.path}');
      _log.info('request header: ${options.headers.toString()}');
      if (options.data != null) {
        _log.info('request params: ${options.data.toString()}');
      }
      print('\r\n');
    }
    return options;
  }

  @override
  onResponse(Response response) async {
    if (Constants.DEBUG) {
      if (response != null) {
        _log.info('response: ${response.toString()}');
        print('\r\n');
      }
    }

    return response;
  }

  @override
  onError(DioError error) async {
    if (Constants.DEBUG) {
      _log.severe('request error info: ${error.response?.toString() ?? ""}');
    }
    return error;
  }
}
