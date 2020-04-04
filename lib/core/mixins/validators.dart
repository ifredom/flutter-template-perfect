import 'package:template/core/utils/res/local_keys.dart';

/// 要使用 Validators验证类，使用 with 将其混入
class Validators {
  /// 手机号验证
  final phoneNumberRegExp = RegExp(
      r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');

  /// 邮箱验证
  final emailRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  /// 登录密码：6~16位数字和字符组合
  final passwordRegExp = RegExp(r"(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{6,16}$");

  /// 身份证号码
  RegExp postalCode = new RegExp(
      r'^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|[Xx])$');

  String validateEmail(String value) {
    if (!emailRegExp.hasMatch(value.trim())) {
      return LocalKeys.invalid_email;
    }
    return null;
  }

  String validatePhoneNumber(String value) {
    if (phoneNumberRegExp.hasMatch(value.trim())) {
      return null;
    } else {
      return LocalKeys.invalid_phone_number;
    }
  }

  String validatePassword(String value) {
    if (value.trim().isEmpty) {
      return LocalKeys.password_empty;
    } else if (!passwordRegExp.hasMatch(value.trim())) {
      return LocalKeys.password_invalid;
    }
    return null;
  }

  String validatePostalcode(String value) {
    if (value.length != 18) {
      return LocalKeys.invalid_postal_idcard; // 位数不够
    }
    // 身份证号码正则
    RegExp postalCode = new RegExp(
        r'^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|[Xx])$');
    // 通过验证，说明格式正确，但仍需计算准确性
    if (!postalCode.hasMatch(value)) {
      return LocalKeys.invalid_postal_idcard;
    }
    //将前17位加权因子保存在数组里
    final List idCardList = [
      "7",
      "9",
      "10",
      "5",
      "8",
      "4",
      "2",
      "1",
      "6",
      "3",
      "7",
      "9",
      "10",
      "5",
      "8",
      "4",
      "2"
    ];
    //这是除以11后，可能产生的11位余数、验证码，也保存成数组
    final List idCardYArray = [
      '1',
      '0',
      '10',
      '9',
      '8',
      '7',
      '6',
      '5',
      '4',
      '3',
      '2'
    ];
    // 前17位各自乖以加权因子后的总和
    int idCardWiSum = 0;

    for (int i = 0; i < 17; i++) {
      int subStrIndex = int.parse(value.substring(i, i + 1));
      int idCardWiIndex = int.parse(idCardList[i]);
      idCardWiSum += subStrIndex * idCardWiIndex;
    }
    // 计算出校验码所在数组的位置
    int idCardMod = idCardWiSum % 11;
    // 得到最后一位号码
    String idCardLast = value.substring(17, 18);
    //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
    if (idCardMod == 2) {
      if (idCardLast != 'x' && idCardLast != 'X') {
        return LocalKeys.invalid_postal_idcard;
      }
    } else {
      //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
      if (idCardLast != idCardYArray[idCardMod]) {
        return LocalKeys.invalid_postal_idcard;
      }
    }
    return null;
  }
}
