import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' show InterceptorsWrapper, Response, RequestOptions, Headers;
import 'package:template/core/constants/constants.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';
import '../common/code.dart' show Code;
import '../common/result_data.dart';
import '../apicode/whiteList.dart';

class ApiInterceptors extends InterceptorsWrapper {
  Future<RequestOptions> _generateRequestParams(RequestOptions options) async {
    // do something

    // var params = json.decode(options.data);
    // String apiCode = params.remove("apiCode"); //remove()返回删除得值
    // options.baseUrl = Constants.BASE_URL;

    // params.remove("apiCode"); //remove()返回删除得值
    // options.queryParameters = {};
    // options.queryParameters = params;
    // print("查询参数");
    // print(options.baseUrl);
    // print(options.path);
    // print(options.data);
    // print(options.queryParameters);
    return options;
  }

  // set token
  _getUnWhitelistToken(String apiCode) async {
    String token = await LocalStorage.get(LocalStorageKeys.TOKEN_KEY);
    if (WhiteList.list.contains(apiCode)) {
      token = LocalStorageKeys.DEFAULT_TOKEN;
    }
    return token;
  }

  @override
  onRequest(RequestOptions options) async {
    return _generateRequestParams(options);
  }

  @override
  onResponse(Response response) async {
    RequestOptions options = response.request;
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
