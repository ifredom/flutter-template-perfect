import 'package:dio/dio.dart' show InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:fluter_template_perfect/core/setup/setup_locator.dart';
import 'package:fluter_template_perfect/core/services/local_storage/local_storage_service.dart';
import 'package:fluter_template_perfect/core/utils/res/local_storage_keys.dart';

import '../apicode/whiteList.dart';

class ApiInterceptors extends InterceptorsWrapper {
  final _localStorageService = locator<LocalStorageService>();
  // 白名单
  // ignore: unused_element
  _getUnWhitelistToken(String apiCode) async {
    String token = await _localStorageService.get(LocalStorageKeys.TOKEN_KEY);
    if (WhiteList.list.contains(apiCode)) {
      token = LocalStorageKeys.DEFAULT_TOKEN_KEY;
    }
    return token;
  }

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 请求前，对参数进行额外设置
    return super.onRequest(options, handler);
  }
}
