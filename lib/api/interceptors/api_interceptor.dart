import 'package:dio/dio.dart' show InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:template/core/utils/res/local_storage_keys.dart';

import '../apicode/whiteList.dart';

import 'token_interceptor.dart';

class ApiInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    await _generateRequestParams(options);
    return super.onRequest(options, handler);
  }

  Future<RequestOptions> _generateRequestParams(RequestOptions options) async {
    // 在这里可以对请求参数做额外处理，例如对参数加密
    return options;
  }

  // 非白名单Apicode都需要token。在登陆时,进行token的存储
  _getUnWhitelistToken(String apiCode) async {
    TokenInterceptors tokenInterceptors = TokenInterceptors();
    var token = await tokenInterceptors.getAuthorization();
    if (WhiteList.list.contains(apiCode)) {
      token = LocalStorageKeys.DEFAULT_TOKEN;
    }
    return token;
  }
}
