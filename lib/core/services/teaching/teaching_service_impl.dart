import 'dart:async';
import 'package:template/api/api.dart';
import 'package:template/api/http.dart';
import 'package:template/core/exceptions/auth_exception.dart';
import 'package:template/core/utils/common/logger.dart';
import 'teaching_service.dart';

class TeachingServiceImpl implements TeachingService {
  /// 获取教材列表
  @override
  Future getTeachingBookList({String bookName, String publisherCode}) async {
    try {
      return await httpUtil.request(ApiCode.TEACHINGBOOK_LIST, {
        "bookName": bookName,
        "publisherCode": publisherCode,
      });
    } on Exception {
      Logger.e('TeachingServiceImpl: getTeachingBookList 接口异常');
      throw AuthException('getTeachingBookList 接口异常');
    }
  }
}
