import 'dart:async' show Future;
import 'dart:collection' show HashMap;
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' show Dio, Options, DioError, Response, Headers;
import 'package:logging/logging.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/utils/common/file_helper.dart';

import '../core/constants/constants.dart';
import '../core/utils/common/network_utils.dart' as network_utils;
import 'common/exception_handle.dart' show ExceptionHandle;
import 'http_service.dart';
import 'interceptors/api_interceptor.dart' show ApiInterceptors;
import 'interceptors/error_interceptor.dart' show ErrorInterceptors;
import 'interceptors/header_interceptor.dart' show HeaderInterceptors;
import 'interceptors/log_interceptor.dart' show LogsInterceptors;
import 'interceptors/token_interceptor.dart' show TokenInterceptors;

/// 请求实体类
class HttpServiceImpl implements HttpService {
  static const CONTENT_TYPE_JSON = Headers.jsonContentType;
  static const CONTENT_TYPE_FROM = Headers.formUrlEncodedContentType;

  static HttpServiceImpl instance = HttpServiceImpl();

  static HttpServiceImpl getInstance() => instance;

  static TokenInterceptors _tokenInterceptors = TokenInterceptors();

  final _log = Logger('HttpServiceImpl');
  final _fileHelper = locator<FileHelper>();
  final Dio _dio = Dio();

  HttpServiceImpl() {
    _dio.interceptors.add(LogsInterceptors());
    _dio.interceptors.add(HeaderInterceptors());
    _dio.interceptors.add(_tokenInterceptors);
    _dio.interceptors.add(ApiInterceptors());
    _dio.interceptors.add(ErrorInterceptors(_dio));
  }

  @override
  Future<dynamic> request(
    String apiCode,
    Map params, {
    Map<String, dynamic>? headers,
    Options? options,
    bool isNoTip = false,
  }) async {
    _dio.options.baseUrl = Constants.BASE_URL;

    Map<String, dynamic> _headers = HashMap();

    if (headers != null) {
      _headers.addAll(headers);
    }

    Options _options = Options(method: 'post', contentType: 'application/json');
    _options.headers = _headers;

    Response response;
    try {
      response = await _dio.request(
        Constants.BASE_URL + apiCode,
        data: json.encode(params), // 注意，所有data数据都要encode变为json字符串.
        options: _options,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioError catch (error) {
      _log.severe(error.toString());
      return ExceptionHandle.handleDioException(error, isNoTip);
    }
    if (response.data is DioError) {
      return ExceptionHandle.handleDioException(response.data, isNoTip);
    }
    return response.data;
  }

  @override
  Future<File> downloadFile(String fileUrl) async {
    Response response;

    final file = await _fileHelper.getFileFromUrl(fileUrl);

    try {
      response = await _dio.download(
        fileUrl,
        file.path,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioError catch (e) {
      throw ExceptionHandle.handleDioException(e, false);
    }

    network_utils.checkForNetworkExceptions(response);

    return file;
  }

  @override
  void dispose() {
    _dio.clear();
    _dio.close(force: true);
  }
}

final HttpServiceImpl httpService = HttpServiceImpl.getInstance();
