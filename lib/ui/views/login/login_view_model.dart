import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/core/model/userinfo/user.dart';
import 'package:fluttertemplate/core/services/auth_service.dart';
import 'package:fluttertemplate/core/services/local_storage_service.dart';

import 'package:fluttertemplate/core/utils/common/validators.dart';
import 'package:fluttertemplate/core/utils/res/local_storage_keys.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ViewModelProvider应该使用得是 LoginViewModel中得数据
class LoginViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<LocalStorageService>();
  // 数据从provider中取
  User get user => _authService.currentUser;

  bool _isNewUser = true; // 是否新用户

  final bool _isBusy = false;

  String get mobile => user.mobile ?? '';

  bool get isNewUser => _isNewUser;

  @override
  bool get isBusy => _isBusy;

  int _count = 0;
  int get count => _count;

  /// 密码登录
  Future<void> loginWithPassword(String username, String password) async {
    setBusy(true);
    rebuildUi();
    Future.delayed(const Duration(seconds: 5)).then((value) {
      setBusy(false);
      _count++;
      locator<NavigationService>().navigateTo(Routes.homeView);
    });
  }

  /// 验证码登录
  Future<void> loginWithCode(String mobile, String authCode) async {
    setBusy(true);
    var res = await _authService.signUpWithAuthcode(mobile, authCode);
    print(res);
    setBusy(false);
    // await saveUserInfo(res, mobile);
  }

  /// 是否新用户
  Future queryIsNewUser(String mobile, String id) async {
    var res = await _authService.fetchIsNewUser(mobile, id);

    if (res.data["code"] == 0) {
      return res.data["data"] != "";
    } else {
      Fluttertoast.showToast(msg: res.data["msg"]);
    }
    notifyListeners();
  }

  Future saveUserInfo(dynamic res, String mobile) async {
    if (res.data["code"] == 0) {
      User userInfo = User.fromMap(res.data["data"]);
      _localStorageService.set<String>(StorageKeys.TOKEN_KEY, userInfo.token);
      _localStorageService.set<bool>(StorageKeys.HAS_LOGIN_KEY, true);

      await _authService.updateCurrentUser(userInfo);

      bool isNewUser = await queryIsNewUser(mobile, userInfo.id);
      print("是否新用户: $isNewUser");
      if (isNewUser) {
        await _navigationService.navigateTo(Routes.registerView);
      } else {
        await _navigationService.replaceWith(Routes.homeView);
      }
    } else {
      Fluttertoast.showToast(msg: res.data["msg"]);
    }
  }

  updateIsNewUser(bool isNew) {
    _isNewUser = isNew;
    notifyListeners();
  }
}
