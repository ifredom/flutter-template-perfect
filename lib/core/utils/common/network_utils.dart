import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:template/core/exceptions/network_exception.dart';
import 'package:template/core/app/logger.dart';

void checkForNetworkExceptions(Response response) {
  if (response.statusCode != 200) {
    throw NetworkException('Failed to connect to internet');
  }
}

void showLoadingProgress(received, total) {
  if (total != -1) {
    print('${(received / total * 100).toStringAsFixed(0)}%');
  }
}

dynamic decodeResponseBodyToJson(String body) {
  try {
    final data = convert.jsonDecode(body);
    return data;
  } on FormatException catch (e) {
    print('Network Utils: Failed to decode response body ${e.message}');
    throw NetworkException(e.message);
  }
}
