import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:fluter_template_perfect/ui/views/404.dart';
import 'package:fluter_template_perfect/ui/views/home/home_view/home.dart';
import 'package:fluter_template_perfect/ui/views/login/login_phone_view.dart';
import 'package:fluter_template_perfect/ui/views/login/login_view.dart';
import 'package:fluter_template_perfect/ui/views/product_detail/product_detail_view.dart';
import 'package:fluter_template_perfect/ui/views/register/register_view.dart';
import 'package:fluter_template_perfect/ui/views/start_up/start_up_view.dart';
import 'package:fluter_template_perfect/core/services/hardware_info/hardware_info_service.dart';
import 'package:fluter_template_perfect/core/services/connectivity/connectivity_service.dart';

import 'package:fluter_template_perfect/core/utils/common/file_helper.dart';
// import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fluter_template_perfect/core/services/auth/auth_service.dart';
import 'package:fluter_template_perfect/ui/views/home/home_view/home_view_model.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: LoginPhoneView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ProductDetailView),
    MaterialRoute(page: WidgetNotFound),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: HardwareInfoService),
    LazySingleton(classType: ConnectivityService),
    LazySingleton(classType: FileHelperImpl, asType: FileHelper),
    LazySingleton(classType: HardwareInfoService),
    Presolve(
      classType: SharedPreferences,
      presolveUsing: SharedPreferences.getInstance,
    ),

    LazySingleton(classType: AuthService),
    LazySingleton(classType: HomeViewModel),

    // LazySingleton(classType: HiveServiceImpl, asType: HiveService),
    // LazySingleton(classType: UserService),
  ],
)
class AppSetup {
  /** 除了附加注释之外，没有任何用途 */
}
