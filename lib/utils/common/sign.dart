import 'dart:convert';
import 'package:crypto/crypto.dart';
import '../../constants/constants.dart';

class SignServices {
  static String getSign(Map map) {
    List attrKeys = map.keys.toList();
    attrKeys.sort();
    String str = Constants.APP_SECRET;
    for (var i = 0; i < attrKeys.length; i++) {
      str += "${attrKeys[i]}${map[attrKeys[i]]}";
    }

    Digest d = md5.convert(Utf8Encoder().convert(str + Constants.APP_SECRET));
    return d.toString();
  }
}
