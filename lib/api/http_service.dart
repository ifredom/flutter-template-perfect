import 'dart:io';

import 'package:dio/dio.dart' show Options;

abstract class HttpService {
  /// Send POST request to endpoint/[route] and return the `response`
  /// - if successful: returns decoded json data
  ///
  /// - throws `NetworkException` if GET fails
  /// arguments isNoTip for eventBus
  Future<dynamic> request(
    String apiCode,
    Map params, {
    Map<String, dynamic> headers,
    Options options,
    isNoTip = false,
  });

  /// Download file from [fileUrl] and return the File
  ///
  /// - throws `NetworkException` if file download fails
  Future<File> downloadFile(String fileUrl);

  void dispose();
}
