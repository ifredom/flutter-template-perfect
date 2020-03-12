import 'api.dart';

/// 白名单,无需token
class WhiteListApi {
  static List list = const <String>[
    Api.SIGN_IN,
    Api.GET_CODE,
  ];
}
