import 'dart:async';

import 'package:template/core/model/userinfo/user.dart';

abstract class AuthService {
  User get currentUser;
  String get invitationCode;
  String get userType;
  Future<void> updateCurrentUser(User userinfo);

  Stream<User> get user; // 测试使用流控制数据
  Future signUpWithAuthcode(String mobile, String authCode);
  Future signUpWithAuthPassword(String mobile, String password);
  Future fetchUserInfo(String id);
  Future fetchResetPassword(String vcode, String pwd);
  Future fetchIsNewUser(String mobile, String openId);

  Future fetchUserBalance();

  Future<void> signOut();
  Future<bool> isUserLoggedIn();
  Future<void> updateUserType(String type);
  Future<void> updateUserInvitationCode(String invitationCode);
  Future<void> updateUserNiceName(String name);
  Future<void> updateUserAddress(String name);
  Future<void> updateUserDescription(String name);
  Future<void> updateUserfirstTeachingDate(String name);
  Future<void> updateUserSex(int sex);
}
