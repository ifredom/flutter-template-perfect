import 'package:dio/dio.dart'
    show InterceptorsWrapper, RequestOptions, Response, DioError;
import 'package:chinaculture/constants/constants.dart' show Constants;

class LogsInterceptors extends InterceptorsWrapper {
  // static List
  @override
  onRequest(RequestOptions options) async {
    if (Constants.DEBUG) {
      print('request url: ${options.path}');
      print('request header: ${options.headers.toString()}');
      if (options.data != null) {
        print('request params: ${options.data.toString()}');
      }
      print('\r\n');
    }

    return options;
  }

  @override
  onResponse(Response response) async {
    if (Constants.DEBUG) {
      if (response != null) {
        print('response: ${response.toString()}');
        print('\r\n');
      }
    }

    return response;
  }

  @override
  onError(DioError error) async {
    if (Constants.DEBUG) {
      print('request error: ${error.toString()}');
      print('request error info: ${error.response?.toString() ?? ""}');
    }
    return error;
  }
}
