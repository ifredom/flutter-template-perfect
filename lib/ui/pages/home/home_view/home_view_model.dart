
import 'package:oktoast/oktoast.dart';
import 'package:stacked/stacked.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/exceptions/repository_exception.dart';
import 'package:template/core/model/userinfo/user.dart';
import 'package:template/core/routes/routes.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';

class HomeViewModel extends BaseViewModel{
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  // 数据从provider中取
  User get user => _authService.currentUser;

  bool _isNewUser = true; // 是否新用户
  bool get isNewUser => _isNewUser;


  // 查询用户信息
  Future<void> initialise() async {
    setBusy(true);
    String id = await LocalStorage.get(LocalStorageKeys.USER_ID);
    bool hasLoggedInUser = await _authService.isUserLoggedIn();

    if (hasLoggedInUser) {
      try {
        var res = await _authService.fetchUserInfo(id);
        setBusy(false);
        if (res.data["code"] == 0) {
          User userinfo = User.fromMap(res.data["data"]);
          await _authService.updateCurrentUser(userinfo);
        } else {
          showToast(res.data["msg"]);
        }
      } on RepositoryException {
        setBusy(false);
      }
    } else {
      await _navigationService.pushReplacementNamed(ViewRoutes.loginView);
    }
  }
}
