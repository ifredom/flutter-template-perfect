import 'dart:io';

import 'package:dio/dio.dart' show DioError, Response, DioErrorType;
import 'package:flutter/widgets.dart';
import 'package:oktoast/oktoast.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/ui/routers.dart';

import '../../core/model/response_date/response_data.dart';
import '../../core/services/navigation/navigation_service.dart';
import '../../core/utils/res/local_storage.dart';
import '../../core/utils/res/local_storage_keys.dart';
import 'code.dart';
import 'result_data.dart';

class ExceptionHandle {
  static Future<ResultData> handleDioException(DioError error, bool isNoTip) async {
    Response errorResponse;

    //

    // HTTP请求失败
    if (error.response != null) {
      errorResponse = error.response;
    } else {
      errorResponse = Response(statusCode: 0);
    }

    if (error.type == DioErrorType.CONNECT_TIMEOUT || error.type == DioErrorType.RECEIVE_TIMEOUT) {
      errorResponse.statusCode = Code.timeout_error_code;
    }

    if (error is DioError) {
      // http网络请求成功，服务器返回的信息数据
      if (error.type == DioErrorType.DEFAULT || error.type == DioErrorType.RESPONSE) {
        dynamic e = error.error;

        if (e is SocketException) {
          return ResultData('Socket Exception，检查网络！', true, Code.socket_error_code);
        }
        if (e is HttpException) {
          return ResultData('服务器异常！', true, Code.http_error_code);
        }
        ResponseData res = ResponseData.fromMap(error.response.data);
        showToast(res.msg.toString());

        /// 后台接口，登录失效，跳转到登录 ,https://www.jianshu.com/p/bd6157914c2d
        if (res.code == 10000) {
          final _navigationService = locator<NavigationService>();
          await LocalStorage.set(LocalStorageKeys.TOKEN_KEY, "");
          await _navigationService.navigatorKey.currentState
              .pushNamedAndRemoveUntil(RoutesUtils.loginPage, ModalRoute.withName("/"));
        }

        return ResultData('服务器异常！', true, Code.http_error_code);
      } else if (error.type == DioErrorType.CONNECT_TIMEOUT ||
          error.type == DioErrorType.SEND_TIMEOUT ||
          error.type == DioErrorType.RECEIVE_TIMEOUT) {
        return ResultData('连接超时！', false, Code.timeout_error_code);
      } else if (error.type == DioErrorType.CANCEL) {
        return ResultData('取消请求', false, Code.cancel_error_code);
      } else {
        return ResultData('未知异常', false, Code.unknown_error_code);
      }
    } else {
      return ResultData('未知异常', false, Code.unknown_error_code);
    }
  }
}
