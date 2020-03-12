class ResultData {
  var data;
  bool result;
  int code;
  var headers;

  ResultData(this.data, this.result, this.code, {this.headers});

  ResultData.fromJson(Map<String, dynamic> json)
      : data = json['data'],
        result = json['result'],
        code = json['code'];

  Map<String, dynamic> toJson() => {
        'data': data,
        'result': result,
        'data': data,
      };
}
