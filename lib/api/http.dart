import 'dart:async' show Future;
import 'dart:collection' show HashMap;
import 'dart:convert';
import 'package:dio/dio.dart'
    show Dio, Options, DioError, Response, DioErrorType;
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:template/api/result_data.dart';
import 'package:template/core/constants/constants.dart';
import 'package:template/core/model/response_date/response_data.dart';
import 'package:template/core/routes/routers.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/core/utils/common/logger.dart';
import 'package:template/locator.dart';
import './interceptors/token_interceptor.dart' show TokenInterceptors;
import './interceptors/header_interceptor.dart' show HeaderInterceptors;
import './interceptors/log_interceptor.dart' show LogsInterceptors;
import './interceptors/error_interceptor.dart' show ErrorInterceptors;
import 'interceptors/api_interceptor.dart' show ApiInterceptors;
// import './result_data.dart' show ResultData;
import './code.dart' show Code;

class Api {
  static const CONTENT_TYPE_JSON = 'application/json';
  static const CONTENT_TYPE_FROM = 'application/x-www-form-urlencoded';

  static Api instance;
  final _navigationService = locator<NavigationService>();

  static Api getInstance() {
    if (instance != null) {
      return instance;
    }
    instance = new Api();
    return instance;
  }

  Dio _dio = new Dio();

  TokenInterceptors _tokenInterceptors = new TokenInterceptors();

  Api() {
    _dio.interceptors.add(new HeaderInterceptors());
    _dio.interceptors.add(_tokenInterceptors);
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

      /// 注意，所有data数据都要encode变为json字符串.
      response = await _dio.request(Constants.BASE_URL,
          data: json.encode(data), options: options);
    } on DioError catch (error) {
      Logger.e("异常1");
      return resultError(error, isNoTip);
    }

    if (response.data is DioError) {
      Logger.e("异常2");
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

    if (error.type == DioErrorType.RESPONSE) {
      ResponseData res = ResponseData.fromMap(error.response.data);
      print(res.code);

      showToast(res.msg);

      /// 后台接口异常，跳转到登录 ,https://www.jianshu.com/p/bd6157914c2d
      if (res.code == 10000) {
        // 登录失效
        _navigationService.navigatorKey.currentState.pushNamedAndRemoveUntil(
            RoutesUtils.loginPage, ModalRoute.withName("/"));
      }
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

final Api httpUtil = Api.getInstance();
