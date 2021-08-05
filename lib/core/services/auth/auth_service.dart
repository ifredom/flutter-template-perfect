import 'dart:async';

import 'package:fluter_template_perfect/core/model/userinfo/user.dart';

abstract class AuthService {
  User get currentUser;
  Future<void> updateCurrentUser(User userinfo);
  Stream<User> get user; //  use stream fwith `User`

  Future signUpWithAuthcode(String name, String authCode);
  Future signUpWithAuthPassword(String username, String password);
  Future fetchUserInfo(String id);
  Future fetchResetPassword(String vcode, String pwd);
  Future fetchIsNewUser(String mobile, String openId);

  Future<void> signOut();
  Future<bool> isUserLoggedIn();
  Future<void> updateUserAge(int age);
}
