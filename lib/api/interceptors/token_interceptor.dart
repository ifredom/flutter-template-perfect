import 'package:dio/dio.dart' show InterceptorsWrapper, RequestOptions;
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';

class TokenInterceptors extends InterceptorsWrapper {
  String _token;

  @override
  onRequest(RequestOptions options) async {
    if (_token == null || _token == '') {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers['token'] = _token;
    return options;
  }

  getAuthorization() async {
    String token = await LocalStorage.get(LocalStorageKeys.TOKEN_KEY);
    String result = '';

    if (token == null) {
      result = LocalStorageKeys.DEFAULT_TOKEN;
    } else {
      this._token = token;
      result = token;
    }
    return result;
  }

  clearAuthorization() {
    this._token = null;
    LocalStorage.remove(LocalStorageKeys.TOKEN_KEY);
  }
}
