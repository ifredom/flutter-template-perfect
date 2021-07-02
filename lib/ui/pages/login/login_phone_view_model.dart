import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/mixins/validators.dart';
import 'package:template/core/routes/routes.dart';

// ViewModelProvider应该使用得是 LoginViewModel中得数据
class LoginPhoneViewModel extends BaseViewModel with Validators {
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
    await _navigationService.replaceWith(ViewRoutes.homeView);
  }
}
