import 'package:dio/dio.dart'
    show Interceptor, RequestOptions, Response, ResponseType;
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';

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
    options.headers['token'] = _token;
    return options;
  }

  @override
  onResponse(Response response) async {
    try {
      // 任何请求，只要数据符合规则，res.data.token ,就可以更新token的机制
      Map<String, dynamic> responseJSON = response.data;
      if (response.statusCode == 200 &&
          responseJSON['data'] != null &&
          responseJSON["data"] != '') {
        _token = responseJSON['data']['token'];
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
      return LocalStorageKeys.DEFAULT_TOKEN;
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
