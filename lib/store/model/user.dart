import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class UserInfo {
  String id;
  String token;
  String mobile;
  String nickName;
  int sex;
  String age;
  String provice;
  String city;
  String area;

  UserInfo({
    this.id,
    this.token,
    this.mobile,
    this.nickName,
    this.sex,
    this.age,
    this.provice,
    this.area,
    this.city,
  });

  UserInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        token = json['token'],
        sex = json['sex'],
        age = json['age'],
        provice = json['provice'],
        city = json['city'],
        area = json['area'],
        mobile = json['mobile'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'token': token,
        'sex': sex,
        'age': age,
        'provice': provice,
        'city': city,
        'area': area,
        'mobile': mobile,
      };
}

class UserModel extends UserInfo with ChangeNotifier {
  UserInfo _userInfo = UserInfo(nickName: 'visitor');

  String _jsonResonse = "";
  bool _isFetching = false;
  bool _isLoginIn = false; // isLogin

  bool get isFetching => _isFetching;
  bool get isLoginIn => _isLoginIn;

  String get id => _userInfo.id;
  String get token => _userInfo.token;
  int get sex => _userInfo.sex;
  String get age => _userInfo.age;
  String get provice => _userInfo.provice;
  String get city => _userInfo.city;
  String get area => _userInfo.area;
  String get mobile => _userInfo.mobile;
  UserInfo get userInfo => _userInfo;

  void setToken(token) {
    _userInfo.token = token;
    notifyListeners();
  }

  void setmobile(mobile) {
    _userInfo.mobile = mobile;
    notifyListeners();
  }

  void setNickname(nickName) {
    _userInfo.nickName = nickName;
    notifyListeners();
  }

  void setAddress({String provice, String city, String area}) {
    _userInfo.provice = provice;
    _userInfo.city = city;
    _userInfo.area = area;
    notifyListeners();
  }

  void setSex(sex) {
    _userInfo.sex = sex;
    notifyListeners();
  }

  void setAge(age) {
    _userInfo.age = age;
    notifyListeners();
  }

  void setInfo(UserInfo userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }

  void clearInfo() {
    _userInfo = UserInfo();
    notifyListeners();
  }

  void setIsLoginIn(bool state) {
    _isLoginIn = state;
    notifyListeners();
  }

  String get getResponseText => _jsonResonse;

  List<dynamic> getResponseJson() {
    if (_jsonResonse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(_jsonResonse);
      return json['data'];
    }
    return null;
  }
}
