import 'package:dio/dio.dart'
    show Headers, InterceptorsWrapper, RequestInterceptorHandler, RequestOptions, Response, ResponseInterceptorHandler;
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';

import '../apicode/whiteList.dart';
import '../common/code.dart' show Code;
import '../common/result_data.dart';

class ApiInterceptors extends InterceptorsWrapper {
  // set token
  _getUnWhitelistToken(String apiCode) async {
    String token = await LocalStorage.get(LocalStorageKeys.TOKEN_KEY);
    if (WhiteList.list.contains(apiCode)) {
      token = LocalStorageKeys.DEFAULT_TOKEN;
    }
    return token;
  }

  @override
  onRequest(
    RequestOptions requestOptions,
    RequestInterceptorHandler handler,
  ) async {
    handler.next(requestOptions);
  }

  @override
  onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) async {
    RequestOptions options = response.requestOptions;
    var value;
    try {
      var header = response.headers[Headers.contentTypeHeader];
      if (header != null && header.toString().contains('text')) {
        value = ResultData(response.data, true, Code.success);
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        value = ResultData(
          response.data,
          true,
          Code.success,
          headers: response.headers,
        );
      }
    } catch (error) {
      print('onResponse error：${options.path}\n ${error.toString()}');
      value = ResultData(
        response.data,
        false,
        response.statusCode,
        headers: response.headers,
      );
    }
    return Future.value(value);
  }
}
