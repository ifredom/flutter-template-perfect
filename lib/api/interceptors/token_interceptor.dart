import 'package:dio/dio.dart' show InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';


const _authHeaderToekn = 'token';

class TokenInterceptors extends InterceptorsWrapper {
  String _token;

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (_token == null || _token == '' || _token == LocalStorageKeys.DEFAULT_TOKEN) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    // handler.reject(DioError(
    //   error: Error(error),
    //   requestOptions: options,
    // ));
    options.headers[_authHeaderToekn] = _token;
    return super.onRequest(options, handler);
  }

  getAuthorization() async {
    String token = await LocalStorage.get(LocalStorageKeys.TOKEN_KEY);
    if (token == null || token == '') {
      token = LocalStorageKeys.DEFAULT_TOKEN;
    } else {
      this._token = token;
    }
    return token;
  }

  clearAuthorization() {
    this._token = null;
    LocalStorage.remove(LocalStorageKeys.TOKEN_KEY);
  }
}
