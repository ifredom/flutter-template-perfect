import 'package:dio/dio.dart' show InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/core/services/key_storage_service.dart';
import 'package:fluttertemplate/core/utils/res/local_storage_keys.dart';

const _authHeaderToekn = 'token';

class TokenInterceptors extends InterceptorsWrapper {
  final _localStorageService = locator<KeyStorageService>();
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
    String token = await _localStorageService.get(StorageKeys.TOKEN_KEY);
    String result = '';

    if (token == '') {
      result = StorageKeys.DEFAULT_TOKEN_KEY;
    } else {
      this._token = token;
      result = token;
    }
    return result;
  }

  clearAuthorization() {
    this._token = '';
    _localStorageService.remove(StorageKeys.TOKEN_KEY);
  }
}
