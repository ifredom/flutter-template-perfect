import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fluttertemplate/core/model/userinfo/user.dart';

import 'package:fluttertemplate/core/services/auth_service.dart';
import 'package:fluttertemplate/core/services/key_storage_service.dart';
import 'package:fluttertemplate/core/utils/res/local_storage_keys.dart';

class StartUpViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<KeyStorageService>();

  Future handleStartUpLogic() async {
    final bool hasLoggedInUser = await _authService.isUserLoggedIn();
    print("hasLoggedInUser $hasLoggedInUser");
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
      await _navigationService.replaceWith(Routes.loginView);
    }
  }
}
