import 'package:fluter_template_perfect/core/setup/setup_locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fluter_template_perfect/core/model/userinfo/user.dart';
import 'package:fluter_template_perfect/core/routes/routes.dart';
import 'package:fluter_template_perfect/core/services/auth/auth_service.dart';
import 'package:fluter_template_perfect/core/services/local_storage/local_storage_service.dart';
import 'package:fluter_template_perfect/core/utils/res/local_storage_keys.dart';

class StartUpViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final _localStorageService = locator<LocalStorageService>();

  Future handleStartUpLogic() async {
    final hasLoggedInUser = await _authService.isUserLoggedIn();
    if (hasLoggedInUser) {
      String id = (await _localStorageService.get(LocalStorageKeys.USER_ID_KEY)) ?? "";
      var res = await _authService.fetchUserInfo(id);
      if (res.data["code"] == 0) {
        User userinfo = User.fromMap(res.data["data"]);
        if (userinfo.age! > 18) {
          await _navigationService.replaceWith(ViewRoutes.registerView);
        } else {
          await _navigationService.replaceWith(ViewRoutes.homeView);
        }
      }
    } else {
      await _navigationService.replaceWith(ViewRoutes.loginView);
    }
  }
}
