import 'api.dart';

/// 白名单,无需token验证
class WhiteList {
  static List list = const <String>[
    ApiCode.SIGN_IN,
    ApiCode.GET_CODE
  ];
}
