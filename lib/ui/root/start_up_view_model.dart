import 'package:pedantic/pedantic.dart';
import 'package:stacked/stacked.dart';
import 'package:template/api/common/result_data.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/ui/routers.dart';

import '../../core/model/userinfo/user.dart';
import '../../core/services/auth/auth_service.dart';
import '../../core/services/navigation/navigation_service.dart';
import '../../core/utils/res/local_storage.dart';
import '../../core/utils/res/local_storage_keys.dart';

class StartUpViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    final hasLoggedInUser = await _authService.isUserLoggedIn();

    if (hasLoggedInUser) {
      String id = await LocalStorage.get(LocalStorageKeys.USER_ID);
      print("启动 user_id: $id");
      ResultData res = await _authService.fetchUserInfo(id);
      if (res.data["code"] == 0) {
        User userinfo = User.fromMap(res.data["data"]);
        if (userinfo.userType == "T") {
          unawaited(_navigationService.pushReplacementNamed(RoutesUtils.teacherHomePage));
        } else {
          unawaited(_navigationService.pushReplacementNamed(RoutesUtils.homePage));
        }
      }
    } else {
      await _navigationService.pushReplacementNamed(RoutesUtils.loginPage);
    }
  }
}
