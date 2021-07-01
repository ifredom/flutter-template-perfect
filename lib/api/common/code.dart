/*
 * 状态码
 */
class Code {
  // HTTP状态码
  static const int success = 200;
  static const int success_not_content = 204;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int not_found = 404;
  static const int request_timeout = 408;
  static const int unprocessable_entity = 422;
  static const int interranl_server_error = 500;
  static const int bad_gateway = 502;
  static const int service_unavailable = 503;
  static const int gateway_timeout = 504;

  // 约定错误码
  static const int unknown_code = 1000; // 未知错误
  static const int parse_error_code = 1001; // 数据解析异常
  static const int socket_error_code = 1002; // 连接失败
  static const int http_error_code = 1003; // 网络错误
  static const int send_timeout_code = 1004; // 请求超时
  static const int connect_timeout_code = 1005; // 连接超时
  static const int receive_timeout_code = 1006; // 响应超时
  static const int unknow_host_code = 1007; // 未知主机
  static const int cancel_error_code = 1008; // 取消请求
  static const int unknown_error_code = 9999; // 未知错误代码

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
