import 'dart:async' show Future;
import 'dart:collection' show HashMap;
import 'dart:convert';
import 'package:dio/dio.dart'
    show Dio, Options, DioError, Response, DioErrorType;
import 'package:chinaculture/api/result_data.dart';
import 'package:chinaculture/constants/constants.dart';
import './interceptors/token_interceptor.dart' show TokenInterceptors;
import './interceptors/header_interceptor.dart' show HeaderInterceptors;
import './interceptors/log_interceptor.dart' show LogsInterceptors;
import './interceptors/error_interceptor.dart' show ErrorInterceptors;
import 'interceptors/api_interceptor.dart' show ApiInterceptors;
// import './result_data.dart' show ResultData;
import './code.dart' show Code;

class HTTP {
  static const CONTENT_TYPE_JSON = 'application/json';
  static const CONTENT_TYPE_FROM = 'application/x-www-form-urlencoded';

  static HTTP inst;

  static HTTP getInstance() {
    if (inst != null) {
      return inst;
    }
    inst = new HTTP();
    return inst;
  }

  Dio _dio = new Dio();

  TokenInterceptors _tokenInterceptors = new TokenInterceptors();

  HTTP() {
    _dio.interceptors.add(new HeaderInterceptors());
    // _dio.interceptors.add(_tokenInterceptors);
    _dio.interceptors.add(new LogsInterceptors());
    _dio.interceptors.add(new ErrorInterceptors(_dio));
    _dio.interceptors.add(new ApiInterceptors());
  }

  Future<ResultData> request(
    String apiCode,
    data, {
    Map<String, dynamic> headers,
    Options options,
    isNoTip = false,
  }) async {
    Map<String, dynamic> _headers = new HashMap();
    if (headers != null) {
      _headers.addAll(headers);
    }

    if (options != null) {
      options.headers = _headers;
    } else {
      options = new Options(method: 'post');
      options.headers = _headers;
    }

    Response response;
    try {
      data["apiCode"] = apiCode;
      // 注意，所有data数据都要encode变为json字符串.
      response = await _dio.request(Constants.BASE_URL,
          data: json.encode(data), options: options);
    } on DioError catch (error) {
      return resultError(error, isNoTip);
    }

    if (response.data is DioError) {
      return resultError(response.data, isNoTip);
    }

    return response.data;
  }

  clearAuthorization() {
    _tokenInterceptors.clearAuthorization();
  }

  getAuthorization() async {
    return _tokenInterceptors.getAuthorization();
  }

  resultError(DioError error, bool isNoTip) {
    Response errorResponse;
    if (error.response != null) {
      errorResponse = error.response;
    } else {
      errorResponse = new Response(statusCode: 666);
    }

    if (error.type == DioErrorType.CONNECT_TIMEOUT ||
        error.type == DioErrorType.RECEIVE_TIMEOUT) {
      errorResponse.statusCode = Code.NETWORK_TIMEOUT;
    }

    return new ResultData(
      Code.errorHandleFunction(
        errorResponse.statusCode,
        error.message,
        isNoTip,
      ),
      false,
      errorResponse.statusCode,
    );
  }
}

final HTTP http = HTTP.getInstance();
