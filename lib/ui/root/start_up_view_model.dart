import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/model/userinfo/user.dart';
import 'package:template/core/routes/routes.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';

class StartUpViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    final hasLoggedInUser = await _authService.isUserLoggedIn();

    if (hasLoggedInUser) {
      String id = await LocalStorage.get(LocalStorageKeys.USER_ID);
      var res = await _authService.fetchUserInfo(id);
      if (res.data["code"] == 0) {
        User userinfo = User.fromMap(res.data["data"]);
        if (userinfo.age! > 18) {
          await _navigationService.replaceWith(ViewRoutes.adminHomeView);
        } else {
          await _navigationService.replaceWith(ViewRoutes.homeView);
        }
      }
    } else {
      await _navigationService.replaceWith(ViewRoutes.loginView);
    }
  }
}
