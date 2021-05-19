import 'package:dio/dio.dart' show InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;

class HeaderInterceptors extends InterceptorsWrapper {
  static const int _timeout = 2 * 60 * 1000;
  @override
  onRequest(
    RequestOptions requestOptions,
    RequestInterceptorHandler handler,
  ) async {
    // 设置超时
    requestOptions.connectTimeout = HeaderInterceptors._timeout;
    handler.next(requestOptions);
  }
}
