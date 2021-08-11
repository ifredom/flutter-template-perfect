import 'package:dio/dio.dart' show InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:fluter_template_perfect/core/setup/setup_locator.dart';
import 'package:fluter_template_perfect/core/services/local_storage/local_storage_service.dart';
import 'package:fluter_template_perfect/core/utils/res/local_storage_keys.dart';

const _authHeaderToekn = 'token';

class TokenInterceptors extends InterceptorsWrapper {
  final _localStorageService = locator<LocalStorageService>();
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
    String token = await _localStorageService.get(LocalStorageKeys.TOKEN_KEY);
    String result = '';

    if (token == '') {
      result = LocalStorageKeys.DEFAULT_TOKEN_KEY;
    } else {
      this._token = token;
      result = token;
    }
    return result;
  }

  clearAuthorization() {
    this._token = '';
    _localStorageService.remove(LocalStorageKeys.TOKEN_KEY);
  }
}
