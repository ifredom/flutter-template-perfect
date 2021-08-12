import 'dart:async';
import 'package:fluttertemplate/core/services/api/apicode/api.dart';
import 'package:fluttertemplate/core/services/api/http_service_impl.dart';
import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:logging/logging.dart';

import 'package:fluttertemplate/core/model/userinfo/user.dart';
import 'package:fluttertemplate/core/services/key_storage_service.dart';
import 'package:fluttertemplate/core/utils/res/local_storage_keys.dart';

// 定义异步接口请求
class AuthService {
  final _localStorageService = locator<KeyStorageService>();
  final _log = Logger("AuthServiceImpl");
  User? _currentUser;
  User get currentUser => _currentUser!;

  // 使用stream数据传输通信, 入口sink,出口stream
  // 可参考文章:https://juejin.im/post/5baa4b90e51d450e6d00f12e
  StreamController<User>? _userController;
  Stream<User> get userController => _userController!.stream;

  int _age = 0;
  int get age => _age;

  /// 账号密码登录
  Future signUpWithAuthPassword(
    String username,
    String password,
  ) async {
    _log.severe('AuthServiceImpl: signUpWithAuthcode Exception');
    return await httpService.request(ApiCode.SIGN_IN, {
      "username": username,
      "password": password,
    });
  }

  /// 手机号验证码登录
  Future signUpWithAuthcode(
    String mobile,
    String authCode,
  ) async {
    _log.severe('AuthServiceImpl: signUpWithAuthcode Exception');
    return await httpService.request(ApiCode.SIGN_IN, {
      "mobile": mobile,
      "authCode": authCode,
    });
  }

  // 获取用户信息
  Future fetchUserInfo(
    String id,
  ) async {
    _log.severe('AuthServiceImpl: fetchUserInfo Exception');
    return await httpService.request(ApiCode.CHECK_USERINFO, {"id": id});
  }

  Future fetchResetPassword(
    String vcode,
    String pwd,
  ) async {
    _log.severe('AuthServiceImpl: fetchResetPassword Exception');

    return await httpService.request(ApiCode.RESET_PASSWORD, {"code": vcode, "pwd": pwd});
  }

  Future fetchIsNewUser(
    String mobile,
    String openId,
  ) async {
    _log.severe('AuthServiceImpl: fetchResetPassword Exception');

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
    // 写法二
    // p = (p.toBuilder().type = 'hello world').build();
    // 写法一
    _currentUser = _currentUser!.rebuild((u) => u..age = age);

    _age = age;
  }

  Future<void> signOut() async {
    await _localStorageService.clear();
    _currentUser = User((u) => u
      ..id = ""
      ..token = "");
  }

  Future<bool> isUserLoggedIn() async {
    // await Future.delayed(Duration(milliseconds: 3000));
    String token = (await _localStorageService.get(StorageKeys.TOKEN_KEY)) ?? '';
    return Future.value(token != '');
  }
}
