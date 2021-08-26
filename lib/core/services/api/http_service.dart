import 'dart:io';

import 'package:dio/dio.dart' show Options;

/// 接口
abstract class HttpService {
  /// Send POST request to endpoint/[route] and return the `response`
  ///
  Future<dynamic> request(String apiCode, Map params, {Map<String, dynamic> headers, Options options});

  /// Download file from [fileUrl] and return the File
  /// - throws `NetworkException` if file download fails
  Future<File> downloadFile(String fileUrl);

  void dispose();
}
