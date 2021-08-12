import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:fluttertemplate/core/services/connectivity_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fluttertemplate/core/model/userinfo/user.dart';

import 'package:fluttertemplate/core/services/auth_service.dart';
import 'package:fluttertemplate/core/services/key_storage_service.dart';
import 'package:fluttertemplate/core/utils/res/local_storage_keys.dart';

class StartUpViewModel extends BaseViewModel {
  final _connectivityService = locator<ConnectivityService>();
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<KeyStorageService>();
  final _authService = locator<AuthService>();

  bool? _isConnected;
  bool get isConnected => _isConnected ?? true;

  Future<void> runStartupLogic({bool? connectivityPassed}) async {
    if (connectivityPassed == null) await checkConnectivity();

    if (!_isConnected!) {
      print("无法连接到网络, 请稍后尝试");
      return;
    }

    var forceUpdateRequired = await _authService.isUpdateRequired();

    if (forceUpdateRequired is bool && forceUpdateRequired) {
      print('app需要更新，前往更新页面');
      _navigationService.replaceWith(Routes.updateView);
      return;
    }

    final bool hasLoggedInUser = await _authService.isUserLoggedIn();

    if (hasLoggedInUser) {
      String id = (await _localStorageService.get(StorageKeys.USER_ID_KEY)) ?? "";
      var res = await _authService.fetchUserInfo(id);
      if (res.data["code"] == 0) {
        User userinfo = User.fromMap(res.data["data"]);
        if (userinfo.age! > 18) {
          await _navigationService.replaceWith(Routes.registerView);
        } else {
          await _navigationService.replaceWith(Routes.homeView);
        }
      }
    } else {
      redirectToLogin();
    }
  }

  Future handleStartUpLogic() async {}

  void redirectToLogin() async {
    _navigationService.replaceWith(Routes.loginView);
  }

  checkConnectivity() async {
    _isConnected = await _connectivityService.isConnected;
    notifyListeners();
  }

  onModelReady() async {
    await checkConnectivity();
    runStartupLogic(connectivityPassed: _isConnected);
  }
}
