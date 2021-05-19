import 'package:stacked/stacked.dart';
import 'package:template/locator.dart';
import 'package:template/core/model/userinfo/user.dart';
import 'package:template/core/routes/routes.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';
import 'package:template/core/services/navigation/navigation_service.dart';

class StartUpViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    final hasLoggedInUser = await _authService.isUserLoggedIn();
    print(hasLoggedInUser);
    if (hasLoggedInUser) {
      String id = await LocalStorage.get(LocalStorageKeys.USER_ID);
      var res = await _authService.fetchUserInfo(id);
      if (res.data["code"] == 0) {
        User userinfo = User.fromMap(res.data["data"]);
        if (userinfo.userType == "T") {
          await _navigationService.pushReplacementNamed(ViewRoutes.adminHomeView);
        } else {
          await _navigationService.pushReplacementNamed(ViewRoutes.homeView);
        }
      }
    } else {
      await _navigationService.pushReplacementNamed(ViewRoutes.loginView);
    }
  }
}
