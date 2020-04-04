import 'package:oktoast/oktoast.dart';
import 'package:template/core/enums/view_state.dart';
import 'package:template/core/mixins/validators.dart';
import 'package:template/core/model/userinfo/user.dart';
import 'package:template/core/routes/routers.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/locator.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/core/exceptions/auth_exception.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';
import 'base_view_model.dart';

// ViewModelProvider应该使用得是 LoginViewModel中得数据
class LoginViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  /// 必须实例化用户
  User _user;
  // 数据从provider中取
  User get user => _authService.currentUser;

  bool _isNewUser = true; // 是否新用户

  String get nickName => user.nickName;
  int get gender => user.gender;
  String get firstTeachingDate => user.firstTeachingDate;
  String get detailAddress => user.detailAddress;
  String get description => user.description;

  bool get isNewUser => _isNewUser;

  bool get busy => state == ViewState.Busy;

  /// 密码登录
  Future<void> loginWithPassword(String mobile, String password) async {
    setState(ViewState.Busy);
    try {
      var res = await _authService.signUpWithAuthPassword(mobile, password);
      setState(ViewState.DataFetched);
      saveUserInfo(res, mobile);
    } on AuthException {
      setState(ViewState.Error);
    }
  }

  /// 验证码登录
  Future<void> loginWithVcode(String mobile, String authCode) async {
    setState(ViewState.Busy);
    try {
      var res = await _authService.signUpWithAuthcode(mobile, authCode);
      setState(ViewState.DataFetched);
      saveUserInfo(res, mobile);
    } on AuthException {
      setState(ViewState.Error);
    }
  }

  /// 是否新用户
  Future queryIsNewUser(String mobile, String id) async {
    setState(ViewState.Busy);
    try {
      var res = await _authService.fetchIsNewUser(mobile, id);
      setState(ViewState.DataFetched);
      if (res.data["code"] == 0) {
        return res.data["data"] != "";
      } else {
        setState(ViewState.NoDataAvailable);
        showToast(res.data["msg"]);
      }
    } on AuthException {
      setState(ViewState.Error);
    }
  }

  Future saveUserInfo(dynamic res, String mobile) async {
    if (res.data["code"] == 0) {
      User userInfo = User.fromMap(res.data["data"]);
      LocalStorage.set<String>(LocalStorageKeys.TOKEN_KEY, userInfo.token);
      LocalStorage.set<String>(LocalStorageKeys.USER_ID, userInfo.id);
      LocalStorage.set<bool>(LocalStorageKeys.HAS_LOGIN, true);

      _authService.updateCurrentUser(userInfo);

      bool isNewUser = await queryIsNewUser(mobile, userInfo.id);
      print("是否新用户: $isNewUser");
      if (isNewUser) {
        _navigationService.push(RoutesUtils.completematerialPage);
      } else {
        if (userInfo.userType == "T") {
          _navigationService.pushReplacementNamed(RoutesUtils.teacherHomePage);
        } else {
          _navigationService.pushReplacementNamed(RoutesUtils.homePage);
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
