import 'package:dio/dio.dart' show InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:fluttertemplate/core/app/locator.dart';
import 'package:fluttertemplate/core/utils/common/local_storage.dart';
import 'package:fluttertemplate/core/utils/res/local_storage_keys.dart';

import '../apicode/whiteList.dart';

class ApiInterceptors extends InterceptorsWrapper {
  final _localStorageService = locator<LocalStorage>();
  // 白名单
  // ignore: unused_element
  _getUnWhitelistToken(String apiCode) async {
    String token = _localStorageService.get(StorageKeys.TOKEN_KEY);
    if (WhiteList.list.contains(apiCode)) {
      token = StorageKeys.DEFAULT_TOKEN_KEY;
    }
    return token;
  }

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 请求前，对参数进行额外设置
    return super.onRequest(options, handler);
  }
}
