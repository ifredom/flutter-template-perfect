import 'package:oktoast/oktoast.dart';
import 'package:stacked/stacked.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/mixins/validators.dart';
import 'package:template/core/model/userinfo/user.dart';
import 'package:template/core/routes/routers.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/core/exceptions/repository_exception.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';

// ViewModelProvider应该使用得是 LoginViewModel中得数据
class LoginViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  /// 必须实例化用户
  User _user;
  // 数据从provider中取
  User get user => _authService.currentUser;

  bool _isNewUser = true; // 是否新用户

  bool _isBusy = false;

  String get nickName => user.nickName;
  int get gender => user.gender;
  String get firstTeachingDate => user.firstTeachingDate;
  String get detailAddress => user.detailAddress;
  String get description => user.description;

  bool get isNewUser => _isNewUser;

  bool get isBusy => _isBusy;

  /// 密码登录
  Future<void> loginWithPassword(String username, String password) async {
    setBusy(true);
    try {
      var res = await _authService.signUpWithAuthPassword(username, password);
      setBusy(false);
      await saveUserInfo(res, username);
    } on RepositoryException {
      setBusy(false);
    }
  }

  /// 验证码登录
  Future<void> loginWithVcode(String mobile, String authCode) async {
    setBusy(true);
    try {
      var res = await _authService.signUpWithAuthcode(mobile, authCode);
      setBusy(false);
      saveUserInfo(res, mobile);
    } on RepositoryException {
      setBusy(false);
    }
  }

  /// 是否新用户
  Future queryIsNewUser(String mobile, String id) async {
    setBusy(true);
    try {
      var res = await _authService.fetchIsNewUser(mobile, id);
      setBusy(false);
      if (res.data["code"] == 0) {
        return res.data["data"] != "";
      } else {
        setBusy(false);
        showToast(res.data["msg"]);
      }
    } on RepositoryException {
      setBusy(false);
    }
  }

  Future saveUserInfo(dynamic res, String mobile) async {
    if (res.data["code"] == 0) {
      User userInfo = User.fromMap(res.data["data"]);
      LocalStorage.set<String>(LocalStorageKeys.TOKEN_KEY, userInfo.token);
      LocalStorage.set<bool>(LocalStorageKeys.HAS_LOGIN, true);

      await _authService.updateCurrentUser(userInfo);

      bool isNewUser = await queryIsNewUser(mobile, userInfo.id);
      print("是否新用户: $isNewUser");
      if (isNewUser) {
        await _navigationService.push(ViewRoutes.audioPlayDemoPage);
      } else {
        if (userInfo.userType == "admin") {
          await _navigationService.pushReplacementNamed(ViewRoutes.adminHomePage);
        } else {
          await _navigationService.pushReplacementNamed(ViewRoutes.homePage);

        }
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
