import 'package:dio/dio.dart' show InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:fluter_template_perfect/core/utils/res/local_storage.dart';
import 'package:fluter_template_perfect/core/utils/res/local_storage_keys.dart';

import '../apicode/whiteList.dart';

class ApiInterceptors extends InterceptorsWrapper {
  // 白名单
  // ignore: unused_element
  _getUnWhitelistToken(String apiCode) async {
    String token = await LocalStorage.get(LocalStorageKeys.TOKEN_KEY);
    if (WhiteList.list.contains(apiCode)) {
      token = LocalStorageKeys.DEFAULT_TOKEN;
    }
    return token;
  }

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 请求前，对参数进行额外设置
    return super.onRequest(options, handler);
  }
}
