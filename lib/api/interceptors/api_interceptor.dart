import 'dart:convert';

import 'package:dio/dio.dart'
    show InterceptorsWrapper, Response, RequestOptions, Headers;
import 'package:chinaculture/constants/constants.dart';
import 'package:chinaculture/utils/common/sign.dart';
import 'package:chinaculture/utils/res/local_storage.dart';
import 'package:chinaculture/utils/res/local_storage_keys.dart';
import '../code.dart' show Code;
import '../result_data.dart' show ResultData;
import '../whiteListApi.dart';

class ApiInterceptors extends InterceptorsWrapper {
  Future<RequestOptions> _generateRequestParams(RequestOptions options) async {
    String time = DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch)
        .toString();
    var params = json.decode(options.data);
    var apiCode = params.remove("apiCode"); //remove()返回删除得值
    params["isMobile"] = "1";

    /// 为了给sign使用
    Map signMap = Map();
    signMap["apiCode"] = apiCode;
    signMap["appId"] = Constants.APP_ID;
    signMap["params"] = jsonEncode(params);
    signMap["timeStamp"] = time.substring(0, time.length - 4);
    signMap["token"] = await _getToken(apiCode);

    /// 为了给sign使用 -end

    options.queryParameters = {};
    options.baseUrl = Constants.BASE_URL;
    options.path = '';
    options.queryParameters["apiCode"] = apiCode;
    options.queryParameters["appId"] = Constants.APP_ID;
    options.queryParameters["params"] = json.encode(params);
    options.queryParameters["timeStamp"] = time.substring(0, time.length - 4);
    options.queryParameters["token"] = await _getToken(apiCode);
    options.queryParameters["sign"] = SignServices.getSign(signMap);

    return options;
  }

  // 只在登陆时,进行token的存储
  _getToken(String apiCode) async {
    String token;
    if (WhiteListApi.list.contains(apiCode)) {
      token = 'noToken';
    } else {
      token = await LocalStorage.get(LocalStorageKeys.TOKEN_KEY);
    }
    return token;
  }

  @override
  onRequest(RequestOptions options) async {
    // print('---api-data--> ${options.data}');
    // print('---api-baseUrl--> ${options.baseUrl}');
    // print('---api->path--> ${options.path}');
    // print('---api->queryParameters--> ${options.queryParameters}');
    return _generateRequestParams(options);
  }

  @override
  onResponse(Response response) async {
    RequestOptions options = response.request;
    var value;
    try {
      var header = response.headers[Headers.contentTypeHeader];

      if (header != null && header.toString().contains('text')) {
        value = new ResultData(response.data, true, Code.SUCCESS);
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        value = new ResultData(
          response.data,
          true,
          Code.SUCCESS,
          headers: response.headers,
        );
        // print(value.toJson());
      }
    } catch (error) {
      print('${options.path}\n ${error.toString()}');
      value = new ResultData(
        response.data,
        false,
        response.statusCode,
        headers: response.headers,
      );
    }
    return Future.value(value);
  }
}
