import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertemplate/ui/views/404.dart';
import 'package:fluttertemplate/ui/views/home/home_view/home.dart';
import 'package:fluttertemplate/ui/views/login/login_phone_view.dart';
import 'package:fluttertemplate/ui/views/login/login_view.dart';
import 'package:fluttertemplate/ui/views/product_detail/product_detail_view.dart';
import 'package:fluttertemplate/ui/views/register/register_view.dart';
import 'package:fluttertemplate/ui/views/start_up/start_up_view.dart';
import 'package:fluttertemplate/core/services/hardware_info_service.dart';
import 'package:fluttertemplate/core/services/connectivity_service.dart';
import 'package:fluttertemplate/core/services/share_service.dart';
import 'package:fluttertemplate/core/services/url_service.dart';
import 'package:fluttertemplate/core/services/key_storage_service.dart';
import 'package:fluttertemplate/core/services/environment_service.dart';

import 'package:fluttertemplate/core/utils/common/file_helper.dart';
// import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:fluttertemplate/core/services/auth_service.dart';
import 'package:fluttertemplate/ui/views/home/home_view/home_view_model.dart';
import './injection.dart';

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
    Presolve(
      classType: EnvironmentService,
      presolveUsing: EnvironmentService.getInstance,
    ),
    Presolve(
      classType: PackageInjection,
      presolveUsing: PackageInjection.getInstance,
    ),
    Presolve(
      classType: SharedPreferences,
      presolveUsing: SharedPreferences.getInstance,
    ),

    /// Stacked Services
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: SnackbarService),

    // common services
    LazySingleton(classType: Connectivity),
    LazySingleton(classType: ConnectivityService),
    LazySingleton(classType: OpenLinkService),
    LazySingleton(classType: ShareService),
    LazySingleton(classType: HardwareInfoService),
    LazySingleton(classType: FileHelperImpl, asType: FileHelper),
    LazySingleton(classType: KeyStorageService),

    LazySingleton(classType: AuthService),
    LazySingleton(classType: HomeViewModel),

    // LazySingleton(classType: HiveServiceImpl, asType: HiveService),
    // LazySingleton(classType: UserService),
  ],
)
class App {
  /** 除了附加注释之外，没有任何用途 */
}
