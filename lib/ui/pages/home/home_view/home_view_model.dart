import 'package:oktoast/oktoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fluter_template_perfect/core/app/locator.dart';
import 'package:fluter_template_perfect/core/exceptions/repository_exception.dart';
import 'package:fluter_template_perfect/core/model/userinfo/user.dart';
import 'package:fluter_template_perfect/core/routes/routes.dart';
import 'package:fluter_template_perfect/core/services/auth/auth_service.dart';

import 'package:fluter_template_perfect/core/utils/res/local_storage.dart';
import 'package:fluter_template_perfect/core/utils/res/local_storage_keys.dart';

class HomeViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  // 数据从provider中取
  User get user => _authService.currentUser;

  bool _isNewUser = true; // 是否新用户
  bool get isNewUser => _isNewUser;

  // 初始化，可以做点什么，比如fetch数据，用户信息
  Future<void> initialise() async {
    setBusy(true);
    String id = await LocalStorage.get(LocalStorageKeys.USER_ID);

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
