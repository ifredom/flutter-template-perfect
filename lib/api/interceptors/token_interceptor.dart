import 'package:dio/dio.dart' show InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';

const _authHeaderToekn = 'token';

class TokenInterceptors extends InterceptorsWrapper {
  String _token = '';

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (_token == '') {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers[_authHeaderToekn] = _token;
    return super.onRequest(options, handler);
  }

  getAuthorization() async {
    String token = await LocalStorage.get(LocalStorageKeys.TOKEN_KEY);
    String result = '';

    if (token == '') {
      result = LocalStorageKeys.DEFAULT_TOKEN;
    } else {
      this._token = token;
      result = token;
    }
    return result;
  }

  clearAuthorization() {
    this._token = '';
    LocalStorage.remove(LocalStorageKeys.TOKEN_KEY);
  }
}
