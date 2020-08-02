import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart' show InterceptorsWrapper, Response, RequestOptions, Headers;
import '../../core/constants/constants.dart';
import '../../core/utils/res/local_storage.dart';
import '../../core/utils/res/local_storage_keys.dart';
import '../common/code.dart' show Code;
import '../common/result_data.dart';
import '../apicode/whiteList.dart';

class ApiInterceptors extends InterceptorsWrapper {
  Future<RequestOptions> _generateRequestParams(RequestOptions options) async {
    String time = DateTime.fromMillisecondsSinceEpoch(DateTime.now().millisecondsSinceEpoch).toString();
    var params = json.decode(options.data);
    var apiCode = params.remove("apiCode"); //remove()返回删除得值
    /// 为了给sign使用
    Map signMap = Map();
    signMap["apiCode"] = apiCode;
    signMap["appId"] = Constants.APP_ID;
    signMap["params"] = jsonEncode(params);
    signMap["timeStamp"] = time.substring(0, time.length - 4);
    signMap["token"] = await _getUnWhitelistToken(apiCode);

    /// 为了给sign使用 -end
    options.queryParameters = {};
    options.baseUrl = Constants.BASE_URL;
    options.path = '';
    options.queryParameters["apiCode"] = apiCode;
    options.queryParameters["appId"] = Constants.APP_ID;
    options.queryParameters["params"] = json.encode(params);
    options.queryParameters["timeStamp"] = time.substring(0, time.length - 4);
    options.queryParameters["token"] = await _getUnWhitelistToken(apiCode);
    options.queryParameters["sign"] = _getSign(signMap);
    return options;
  }

  // 在登陆时,进行token的存储
  _getUnWhitelistToken(String apiCode) async {
    String token = await LocalStorage.get(LocalStorageKeys.TOKEN_KEY);
    if (WhiteList.list.contains(apiCode)) {
      token = LocalStorageKeys.DEFAULT_TOKEN;
    }
    return token;
  }

  // 签名
  String _getSign(Map map) {
    List attrKeys = map.keys.toList();
    attrKeys.sort();
    String str = Constants.APP_SECRET;
    for (var i = 0; i < attrKeys.length; i++) {
      str += "${attrKeys[i]}${map[attrKeys[i]]}";
    }
    Digest d = md5.convert(Utf8Encoder().convert(str + Constants.APP_SECRET));
    return d.toString();
  }

  @override
  onRequest(RequestOptions options) async {
    return _generateRequestParams(options);
  }

  @override
  onResponse(Response response) async {
    RequestOptions options = response.request;
    var value;
    try {
      var header = response.headers[Headers.contentTypeHeader];
      if (header != null && header.toString().contains('text')) {
        value = ResultData(response.data, true, Code.success);
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        value = ResultData(
          response.data,
          true,
          Code.success,
          headers: response.headers,
        );
      }
    } catch (error) {
      print('onResponse error：${options.path}\n ${error.toString()}');
      value = ResultData(
        response.data,
        false,
        response.statusCode,
        headers: response.headers,
      );
    }
    return Future.value(value);
  }
}
