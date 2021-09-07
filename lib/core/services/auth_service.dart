import 'dart:async';
import 'package:fluttertemplate/core/app/app.logger.dart';
import 'package:fluttertemplate/core/app/locator.dart';
import 'package:fluttertemplate/core/model/userinfo/user.dart';
import 'package:fluttertemplate/core/services/api/apicode/api.dart';
import 'package:fluttertemplate/core/services/api/http_service_impl.dart';
import 'package:fluttertemplate/core/utils/common/local_storage.dart';
import 'package:fluttertemplate/core/utils/res/local_storage_keys.dart';

// 定义异步接口请求
class AuthService {
  final _log = getLogger("AuthServiceImpl");
  final _localStorageService = locator<LocalStorage>();
  User? _currentUser;
  User get currentUser => _currentUser!;

  bool get hasLoggedInUser => _localStorageService.get(StorageKeys.HAS_LOGIN_KEY) ?? false;

  // 检查App更新。是否必须更新app
  Future isUpdateRequired() async {
    print("检查App更新");
    int _testVersion = 1;
    return _handleVersionUpdate(_testVersion);
  }

  // api版本是否大于当前版本
  bool _handleVersionUpdate(int apiVersion) {
    // 根据app版本设置，此处假设为0
    int _packageInfoBuildNumber = 2;
    int currentVersion = _packageInfoBuildNumber;
    return apiVersion > currentVersion;
  }

  /// 账号密码登录
  Future signUpWithAuthPassword(String username, String password) async {
    _log.i('接口: 账号密码登录');
    return await httpService.request(ApiCode.SIGN_IN, {
      "username": username,
      "password": password,
    });
  }

  /// 手机号验证码登录
  Future signUpWithAuthcode(String mobile, String authCode) async {
    _log.i('接口: 手机号验证码登录');
    return await httpService.request(ApiCode.SIGN_IN, {
      "mobile": mobile,
      "authCode": authCode,
    });
  }

  // 获取用户信息
  Future fetchUserInfo(String id) async {
    _log.i('接口: 获取用户信息');
    return await httpService.request(ApiCode.CHECK_USERINFO, {"id": id});
  }

  Future fetchResetPassword(String vcode, String pwd) async {
    _log.i('AuthServiceImpl: fetchResetPassword Exception');
    return await httpService.request(ApiCode.RESET_PASSWORD, {"code": vcode, "pwd": pwd});
  }

  Future fetchIsNewUser(String mobile, String openId) async {
    _log.i('接口: 根据手机号查询是否新用户');
    return await httpService.request(ApiCode.ISNEW_USER, {"mobile": mobile, "openId": openId});
  }

  // 更新整个User model：更新用户多条信息
  Future<void> updateCurrentUser(User userinfo) async {
    _currentUser = User((u) => u
      ..id = userinfo.id
      ..token = userinfo.token
      ..mobile = userinfo.mobile
      ..age = userinfo.age);
  }

  // 更新User model某一项：更新用户单条信息
  Future<void> updateUserAge(int age) async {
    // 写法一
    _currentUser = _currentUser!.rebuild((u) => u..age = age);
    // 写法二
    // p = (p.toBuilder().type = 'hello world').build();
  }

  Future<void> signOut() async {
    await _localStorageService.clear();
    _currentUser = User((u) => u
      ..id = ""
      ..token = "");
  }

  Future<bool> isUserLoggedIn() async {
    String token = (await _localStorageService.get(StorageKeys.TOKEN_KEY)) ?? '';
    return Future.value(token != '');
  }
}
