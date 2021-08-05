import 'dart:async';
import 'package:logging/logging.dart';
import 'package:fluter_template_perfect/api/apicode/api.dart';
import 'package:fluter_template_perfect/api/http_service_impl.dart';
import 'package:fluter_template_perfect/core/exceptions/repository_exception.dart';
import 'package:fluter_template_perfect/core/model/userinfo/user.dart';
import 'package:fluter_template_perfect/core/utils/res/local_storage.dart';
import 'package:fluter_template_perfect/core/utils/res/local_storage_keys.dart';

import 'auth_service.dart';

// 定义异步接口请求
class AuthServiceImpl implements AuthService {
  final _log = Logger("AuthServiceImpl");
  late User _currentUser;
  User get currentUser => _currentUser;

  // 使用stream数据传输通信, 入口sink,出口stream
  // 可参考文章:https://juejin.im/post/5baa4b90e51d450e6d00f12e
  StreamController<User> _userController = StreamController<User>();
  Stream<User> get user => _userController.stream;

  int _age = 0;
  int get age => _age;

  /// 账号密码登录
  @override
  Future signUpWithAuthPassword(
    String username,
    String password,
  ) async {
    try {
      return await httpService.request(ApiCode.SIGN_IN, {
        "username": username,
        "password": password,
      });
    } on Exception {
      _log.severe('AuthServiceImpl: signUpWithAuthcode Exception');
      throw RepositoryException('signUpWithAuthcode Exception');
    }
  }

  /// 手机号验证码登录
  @override
  Future signUpWithAuthcode(
    String mobile,
    String authCode,
  ) async {
    try {
      return await httpService.request(ApiCode.SIGN_IN, {
        "mobile": mobile,
        "authCode": authCode,
      });
    } on Exception {
      _log.severe('AuthServiceImpl: signUpWithAuthcode Exception');
      throw RepositoryException('signUpWithAuthcode Exception');
    }
  }

  // 获取用户信息
  @override
  Future fetchUserInfo(
    String id,
  ) async {
    try {
      return await httpService.request(ApiCode.CHECK_USERINFO, {"id": id});
    } on Exception {
      _log.severe('AuthServiceImpl: fetchUserInfo Exception');
      throw RepositoryException('fetchUserInfo Exception');
    }
  }

  @override
  Future fetchResetPassword(
    String vcode,
    String pwd,
  ) async {
    try {
      return await httpService.request(ApiCode.RESET_PASSWORD, {"code": vcode, "pwd": pwd});
    } on Exception {
      _log.severe('AuthServiceImpl: fetchResetPassword Exception');
      throw RepositoryException('fetchResetPassword Exception');
    }
  }

  @override
  Future fetchIsNewUser(
    String mobile,
    String openId,
  ) async {
    try {
      return await httpService.request(ApiCode.ISNEW_USER, {"mobile": mobile, "openId": openId});
    } on Exception {
      _log.severe('AuthServiceImpl: fetchResetPassword Exception');
      throw RepositoryException('fetchResetPassword Exception');
    }
  }

  // 更新整个User model：更新用户多条信息
  @override
  Future<void> updateCurrentUser(User userinfo) async {
    _currentUser = User((u) => u
      ..id = userinfo.id
      ..token = userinfo.token
      ..mobile = userinfo.mobile
      ..age = userinfo.age);
  }

  // 更新User model某一项：更新用户单条信息
  @override
  Future<void> updateUserAge(int age) async {
    // 写法二
    // p = (p.toBuilder().type = 'hello world').build();
    // 写法一
    _currentUser = _currentUser.rebuild((u) => u..age = age);

    _age = age;
  }

  @override
  Future<void> signOut() async {
    await LocalStorage.clear();
    _currentUser = User((u) => u
      ..id = ""
      ..token = "");
  }

  @override
  Future<bool> isUserLoggedIn() async {
    // await Future.delayed(Duration(milliseconds: 3000));
    String token = (await LocalStorage.get(LocalStorageKeys.TOKEN_KEY)) ?? '';
    return Future.value(token != '');
  }
}
