import 'package:fluter_template_perfect/core/model/userinfo/user.dart';
import 'package:fluter_template_perfect/core/services/auth/auth_service.dart';
import 'package:fluter_template_perfect/core/setup/setup_locator.dart';
import 'package:fluter_template_perfect/core/services/local_storage/local_storage_service.dart';
import 'package:fluter_template_perfect/core/utils/res/local_storage_keys.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _localStorageService = locator<LocalStorageService>();

  // 数据从provider中取
  User get user => _authService.currentUser;

  bool _isNewUser = true; // 是否新用户
  bool get isNewUser => _isNewUser;

  // 初始化，可以做点什么，比如fetch数据，用户信息
  Future<void> initialise() async {
    setBusy(true);
    String id = (await _localStorageService.get(LocalStorageKeys.USER_ID_KEY)) ?? "";

    var res = await _authService.fetchUserInfo(id);
    setBusy(false);
    if (res.data["code"] == 0) {
      User userinfo = User.fromMap(res.data["data"]);
      await _authService.updateCurrentUser(userinfo);
    } else {
      showToast(res.data["msg"]);
    }

    setBusy(false);
  }
}
