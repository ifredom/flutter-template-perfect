import 'package:dio/dio.dart' show InterceptorsWrapper, RequestInterceptorHandler, RequestOptions;

class HeaderInterceptors extends InterceptorsWrapper {
  static const int _timeout = 2 * 60 * 1000;
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    // 设置超时
    options.connectTimeout = HeaderInterceptors._timeout;
    return super.onRequest(options, handler);
  }
}
