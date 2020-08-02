/*
 * 状态码
 */
class Code {
  static const int success = 200;
  static const int success_not_content = 204;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int not_found = 404;

  static const int net_error_code = 1000;
  static const int parse_error_code = 1001;
  static const int socket_error_code = 1002;
  static const int http_error_code = 1003;
  static const int timeout_error_code = 1004;
  static const int cancel_error_code = 1005;
  static const int unknown_error_code = 9999;

  static const String net_error_message = "网络异常";
  static const String socket_error_message = "Socket Exception，检查网络！";
  static const String http_error_message = "服务器异常！";
  static const String timeout_error_message = "连接超时！";
  static const String cancel_error_message = "取消请求";
  static const String unknown_error_message = "未知异常";

  // 分发错误信息
  static errorHandleFunction(code, message, isNoTip) {
    if (isNoTip) {
      return message;
    }
    // eventBus.dispatch(new HttpErrorEvent(code, message));
    return message;
  }
}
