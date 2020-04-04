import 'api.dart';

/// 白名单,无需token
class WhiteListApi {
  static List list = const <String>[
    ApiCode.SIGN_IN,
    ApiCode.GET_CODE,
  ];
}
