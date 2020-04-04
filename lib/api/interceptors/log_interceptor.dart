import 'package:dio/dio.dart'
    show InterceptorsWrapper, RequestOptions, Response, DioError;
import 'package:template/core/constants/constants.dart';
import 'package:template/core/utils/common/logger.dart';

class LogsInterceptors extends InterceptorsWrapper {
  // static List
  @override
  onRequest(RequestOptions options) async {
    if (Constants.DEBUG) {
      Logger.d('request url: ${options.path}');
      Logger.d('request header: ${options.headers.toString()}');
      if (options.data != null) {
        Logger.d('request params: ${options.data.toString()}');
      }
      Logger.d('\r\n');
    }

    return options;
  }

  @override
  onResponse(Response response) async {
    if (Constants.DEBUG) {
      if (response != null) {
        Logger.d('response: ${response.toString()}');
        Logger.d('\r\n');
      }
    }

    return response;
  }

  @override
  onError(DioError error) async {
    if (Constants.DEBUG) {
      Logger.e('request error: ${error.toString()}');
      Logger.e('request error info: ${error.response?.toString() ?? ""}');
    }
    return error;
  }
}
