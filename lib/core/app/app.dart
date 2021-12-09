import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertemplate/core/services/auth_service.dart';
import 'package:fluttertemplate/core/services/connectivity_service.dart';
import 'package:fluttertemplate/core/services/file_helper.dart';
import 'package:fluttertemplate/core/services/hardware_info_service.dart';
import 'package:fluttertemplate/core/services/local_storage_service.dart';
import 'package:fluttertemplate/core/services/share_service.dart';
import 'package:fluttertemplate/core/services/url_service.dart';
import 'package:fluttertemplate/ui/views/home/home_view/home.dart';
import 'package:fluttertemplate/ui/views/login/login_view.dart';
import 'package:fluttertemplate/ui/views/product_detail/product_detail_view.dart';
import 'package:fluttertemplate/ui/views/register/register_view.dart';
import 'package:fluttertemplate/ui/views/start_up/start_up_view.dart';
import 'package:fluttertemplate/ui/views/update/update_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

//  Using StackedApp for state management, generating routes and dependency injection.
//  需要預解析的 shared_preferences service 报错，所以不采用自动生成
@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: UpdateView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ProductDetailView)
  ],
  dependencies: [
    // Lazy singletons
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: Connectivity),

    LazySingleton(classType: ConnectivityService),
    LazySingleton(classType: OpenLinkService),
    LazySingleton(classType: ShareService),
    LazySingleton(classType: HardwareInfoService),
    LazySingleton(classType: FileServiceImpl),
    LazySingleton(classType: AuthService),
    // singletons

    // Presolve
    Presolve(
      classType: LocalStorageService,
      presolveUsing: SharedPreferences.getInstance,
    ),
  ],
  logger: StackedLogger(),
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality(除了附加注释之外，没有任何用途) **/
}
