import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/core/utils/common/validators.dart';
import 'package:fluttertemplate/core/model/userinfo/user.dart';

import 'package:fluttertemplate/core/services/auth_service.dart';
import 'package:fluttertemplate/core/services/key_storage_service.dart';
import 'package:fluttertemplate/core/utils/res/local_storage_keys.dart';

// ViewModelProvider应该使用得是 LoginViewModel中得数据
class LoginViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<KeyStorageService>();

  // 数据从provider中取
  User get user => _authService.currentUser;

  bool _isNewUser = true; // 是否新用户

  bool _isBusy = false;

  String get mobile => user.mobile ?? '';

  bool get isNewUser => _isNewUser;

  bool get isBusy => _isBusy;

  /// 密码登录
  Future<void> loginWithPassword(String username, String password) async {
    _isBusy = true;
    setBusy(true);
    Future.delayed(Duration(seconds: 2), () {
      print('延时执行');
      _isBusy = false;
      setBusy(false);
      _navigationService.replaceWith(Routes.homeView);
    });
  }

  /// 验证码登录
  Future<void> loginWithVcode(String mobile, String authCode) async {
    setBusy(true);
    var res = await _authService.signUpWithAuthcode(mobile, authCode);
    setBusy(false);
    await saveUserInfo(res, mobile);
  }

  /// 是否新用户
  Future queryIsNewUser(String mobile, String id) async {
    setBusy(true);

    var res = await _authService.fetchIsNewUser(mobile, id);
    setBusy(false);
    if (res.data["code"] == 0) {
      return res.data["data"] != "";
    } else {
      setBusy(false);
      showToast(res.data["msg"]);
    }
  }

  Future saveUserInfo(dynamic res, String mobile) async {
    if (res.data["code"] == 0) {
      User userInfo = User.fromMap(res.data["data"]);
      await _localStorageService.set<String>(StorageKeys.TOKEN_KEY, userInfo.token);
      await _localStorageService.set<bool>(StorageKeys.HAS_LOGIN_KEY, true);

      await _authService.updateCurrentUser(userInfo);

      bool isNewUser = await queryIsNewUser(mobile, userInfo.id);
      print("是否新用户: $isNewUser");
      if (isNewUser) {
        await _navigationService.navigateTo(Routes.registerView);
      } else {
        await _navigationService.replaceWith(Routes.homeView);
      }
    } else {
      showToast(res.data["msg"]);
    }
  }

  updateIsNewUser(bool isNew) {
    _isNewUser = isNew;
    notifyListeners();
  }
}
