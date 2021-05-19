// http网络请求
class ResultData {
  dynamic data; // 请求结果：异常信息  （dioError or others error）
  bool result; // 请求结果：成功或者失败 (request: success or false)
  int code; // 状态码：自定义 (state code: my define)
  dynamic headers;

  ResultData(this.data, this.result, this.code, {this.headers});

  ResultData.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        result = json['result'],
        code = json['code'],
        headers = json['headers'];

  Map<String, dynamic> toJson() => {
        'data': data,
        'result': result,
        'code': code,
        'headers': headers,
      };
}
