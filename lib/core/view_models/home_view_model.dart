import 'package:oktoast/oktoast.dart';
import 'package:template/core/enums/view_state.dart';
import 'package:template/core/mixins/validators.dart';
import 'package:template/core/exceptions/repository_exception.dart';
import 'package:template/core/model/userinfo/user.dart';
import 'package:template/core/routes/routers.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/locator.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';
import 'base_view_model.dart';

// ViewModelProvider应该使用得是 HomeViewModel中得数据
class HomeViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  // 数据从provider中取
  User get user => _authService.currentUser;

  bool _isNewUser = true; // 是否新用户
  bool get isNewUser => _isNewUser;

  int _musicStone = 0; // 乐石
  int get musicStone => _musicStone;
  int _musicNote = 0; // 乐符
  int get musicNote => _musicNote;

  bool get busy => state == ViewState.Busy;

  // 查询用户信息
  Future<void> initialise() async {
    setState(ViewState.Busy);
    String id = await LocalStorage.get(LocalStorageKeys.USER_ID);
    bool hasLoggedInUser = await _authService.isUserLoggedIn();

    if (hasLoggedInUser) {
      try {
        var res = await _authService.fetchUserInfo(id);
        setState(ViewState.DataFetched);
        if (res.data["code"] == 0) {
          User userinfo = User.fromMap(res.data["data"]);
          _authService.updateCurrentUser(userinfo);
          getUserBalance();
        } else {
          showToast(res.data["msg"]);
        }
      } on RepositoryException {
        setState(ViewState.Error);
      }
    } else {
      _navigationService.pushReplacementNamed(RoutesUtils.loginPage);
    }
  }

  Future<void> getUserBalance() async {
    var res = await _authService.fetchUserBalance();

    if (res.data["code"] == 0) {
      Map response = res.data["data"];
      _musicStone = response["musicStone"];
      _musicNote = response["musicNote"];
    } else {
      showToast(res.data["msg"]);
    }
  }
}
