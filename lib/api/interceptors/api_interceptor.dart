import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' show InterceptorsWrapper, Response, RequestOptions, Headers;
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';
import '../common/code.dart' show Code;
import '../common/result_data.dart';
import '../apicode/whiteList.dart';

class ApiInterceptors extends InterceptorsWrapper {
  Future<RequestOptions> _generateRequestParams(RequestOptions options) async {
    // 可以做一些加密参数的操作
    Digest d = md5.convert(Utf8Encoder().convert("secretId"));
    return options;
  }

  // 在登陆时,进行token的存储
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
