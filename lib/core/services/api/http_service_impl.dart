import 'dart:async' show Future;
import 'dart:collection' show HashMap;
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' show Dio, DioException, Headers, Options, Response;
import 'package:dio/io.dart';
import 'package:fluttertemplate/core/app/app.logger.dart';
import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/core/constants/constants.dart';
import 'package:fluttertemplate/core/services/file_helper.dart';

import 'package:fluttertemplate/core/utils/common/network_utils.dart' as network_utils;
import 'common/exception_handle.dart' show ExceptionHandle;
import 'http_service.dart';
import 'interceptors/api_interceptor.dart' show ApiInterceptors;
import 'interceptors/error_interceptor.dart' show ErrorInterceptors;
import 'interceptors/header_interceptor.dart' show HeaderInterceptors;
import 'interceptors/log_interceptor.dart' show LogsInterceptors;
import 'interceptors/token_interceptor.dart' show TokenInterceptors;

/// 请求实体类
class HttpServiceImpl implements HttpService {
  static HttpServiceImpl getInstance() => HttpServiceImpl();
  static TokenInterceptors _tokenInterceptors = TokenInterceptors();

  final _log = getLogger('HttpServiceImpl');

  final Dio _dio = Dio();

  HttpServiceImpl() {
    // 初始化http请求参数
    _dio
      ..options.baseUrl = Constants.BASE_URL
      ..options.connectTimeout = Duration(seconds: 5)
      ..options.receiveTimeout = Duration(seconds: 3)
      ..httpClientAdapter;

    // 添加拦截器
    _dio.interceptors.add(LogsInterceptors());
    _dio.interceptors.add(HeaderInterceptors());
    _dio.interceptors.add(_tokenInterceptors);
    _dio.interceptors.add(ApiInterceptors());
    _dio.interceptors.add(ErrorInterceptors());

    if (Constants.useProxy) {
      final adapter = _dio.httpClientAdapter as IOHttpClientAdapter;

      adapter.createHttpClient = () {
        HttpClient httpClient = HttpClient();
        // 设置Http代理
        httpClient.findProxy = (uri) {
          return "PROXY ${Constants.proxyAddress}";
        };

        // https证书校验
        httpClient.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
        return httpClient;
      };
    }
  }

  @override
  Future<dynamic> request(String apiCode, Map params, {Map<String, dynamic>? headers, Options? options}) async {
    Options _options = Options(method: 'post', contentType: Headers.jsonContentType);
    if (headers != null) {
      Map<String, dynamic> _headers = HashMap();
      _headers.addAll(headers);
      _options.headers = _headers;
    }

    Response response;
    try {
      response = await _dio.request(
        Constants.BASE_URL + apiCode,
        data: json.encode(params), // 注意，所有data数据都要encode变为json字符串.
        options: _options,
        onSendProgress: network_utils.showLoadingProgress,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioException catch (error) {
      _log.e(error.toString());
      return ExceptionHandle.handleDioException(error);
    }
    return response.data;
  }

  @override
  Future<File> downloadFile(String fileUrl) async {
    Response response;
    final _fileHelper = locator<FileService>();
    final file = await _fileHelper.getFileFromUrl(fileUrl);

    try {
      response = await _dio.download(
        fileUrl,
        file.path,
        onReceiveProgress: network_utils.showLoadingProgress,
      );
    } on DioException catch (e) {
      throw ExceptionHandle.handleDioException(e);
    }

    network_utils.checkForNetworkExceptions(response);

    return file;
  }

  @override
  void dispose() {
    _dio.close(force: true);
  }
}

final HttpServiceImpl httpService = HttpServiceImpl.getInstance();
