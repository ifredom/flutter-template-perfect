import 'package:fluttertemplate/core/model/userinfo/user.dart';
import 'package:fluttertemplate/core/services/auth_service.dart';
import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/core/services/key_storage_service.dart';
import 'package:fluttertemplate/core/utils/res/local_storage_keys.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _localStorageService = locator<KeyStorageService>();

  // 数据从provider中取
  User get user => _authService.currentUser;

  bool _isNewUser = true; // 是否新用户
  bool get isNewUser => _isNewUser;

  // 初始化，可以做点什么，比如fetch数据，用户信息
  Future<void> initialise() async {
    setBusy(true);
    String id = (await _localStorageService.get(StorageKeys.USER_ID_KEY)) ?? "";

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
