import 'package:dio/dio.dart' show Interceptor, RequestOptions, Response;
import 'package:chinaculture/utils/res/local_storage.dart';
import 'package:chinaculture/utils/res/local_storage_keys.dart';

class TokenInterceptors extends Interceptor {
  String _token;

  @override
  onRequest(RequestOptions options) async {
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers['Authorization'] = _token;
    return options;
  }

  @override
  onResponse(Response response) async {
    try {
      var responseJSON = response.data;
      if (response.statusCode == 201 && responseJSON['token'] != null) {
        _token = 'token ' + responseJSON['token'];
        await LocalStorage.set(LocalStorageKeys.TOKEN_KEY, _token);
      }
    } catch (e) {
      print(e);
    }
    return response;
  }

  getAuthorization() async {
    String token = await LocalStorage.get(LocalStorageKeys.TOKEN_KEY);
    if (token == null) {
    } else {
      this._token = token;
      return token;
    }
  }

  clearAuthorization() {
    this._token = null;
    LocalStorage.remove(LocalStorageKeys.TOKEN_KEY);
  }
}
