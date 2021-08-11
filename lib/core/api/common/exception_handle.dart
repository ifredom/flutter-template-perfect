import 'dart:io';

import 'package:dio/dio.dart' show DioError, DioErrorType;
import 'package:flutter/widgets.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fluter_template_perfect/core/routes/routes.dart';
import 'package:fluter_template_perfect/core/utils/res/local_storage.dart';
import 'package:fluter_template_perfect/core/utils/res/local_storage_keys.dart';

import 'code.dart';
import 'result_data.dart';

class ExceptionHandle {
  static Future<ResultData> handleDioException(DioError error, bool isNoTip) async {
    if (error is DioError) {
      // http网络请求成功，服务器返回的信息数据
      if (error.type == DioErrorType.other || error.type == DioErrorType.response) {
        dynamic e = error.error;

        if (e is SocketException) {
          return ResultData('Socket Exception，检查网络！', true, Code.socket_error_code);
        }
        if (e is HttpException) {
          return ResultData('服务器异常！', true, Code.http_error_code);
        }
        var res = error.response?.data;
        showToast(res.msg.toString());

        /// 后台接口，登录失效，跳转到登录 ,https://www.jianshu.com/p/bd6157914c2d
        if (res.code == 10000) {
          await LocalStorage.set(LocalStorageKeys.TOKEN_KEY, "");
          await StackedService.navigatorKey!.currentState!
              .pushNamedAndRemoveUntil(ViewRoutes.loginView, ModalRoute.withName("/"));
        }

        return ResultData('服务器异常！', true, Code.http_error_code);
      } else if (error.type == DioErrorType.connectTimeout ||
          error.type == DioErrorType.sendTimeout ||
          error.type == DioErrorType.receiveTimeout) {
        return ResultData('连接超时！', false, Code.connect_timeout_code);
      } else if (error.type == DioErrorType.cancel) {
        return ResultData('取消请求', false, Code.cancel_error_code);
      } else {
        return ResultData('未知异常', false, Code.unknown_error_code);
      }
    } else {
      return ResultData('未知异常', false, Code.unknown_error_code);
    }
  }
}
