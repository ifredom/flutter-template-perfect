import 'package:stacked/stacked.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/exceptions/repository_exception.dart';
import 'package:template/core/mixins/validators.dart';
import 'package:template/core/routes/routers.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/services/navigation/navigation_service.dart';

// ViewModelProvider应该使用得是 LoginViewModel中得数据
class LoginPhoneViewModel extends BaseViewModel with Validators {
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  bool _isBusy = false;

  bool get isBusy => _isBusy;

  /// 初始化数据，比如网络请求
  Future<void> init() async {
    setBusy(true);
    // 延时3s执行返回
    Future.delayed(Duration(seconds: 3), () {
      print('延时1s执行');
      setBusy(false);
    });
  }

  Future<void> loginWithPassword(String mobile, String password) async {
    // var res = await _authService.signUpWithAuthPassword(mobile, password);
    await _navigationService.pushReplacementNamed(ViewRoutes.homePage);
  }
}
