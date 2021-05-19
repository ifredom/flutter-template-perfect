import 'dart:async';

import 'package:template/core/model/userinfo/user.dart';

abstract class AuthService {
  User get currentUser;
  String get invitationCode;
  String get userType;
  Future<void> updateCurrentUser(User userinfo);

  Stream<User> get user; // 使用流控制数据
  Future signUpWithAuthcode(String name, String authCode);
  Future signUpWithAuthPassword(String username, String password);
  Future fetchUserInfo(String id);
  Future fetchResetPassword(String vcode, String pwd);
  Future fetchIsNewUser(String mobile, String openId);

  Future<void> signOut();
  Future<bool> isUserLoggedIn();
}
