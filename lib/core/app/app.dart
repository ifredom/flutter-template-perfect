import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertemplate/core/services/auth_service.dart';
import 'package:fluttertemplate/core/services/connectivity_service.dart';
import 'package:fluttertemplate/core/services/file_helper.dart';
import 'package:fluttertemplate/core/services/hardware_info_service.dart';
import 'package:fluttertemplate/core/services/local_storage_service.dart';
import 'package:fluttertemplate/core/services/share_service.dart';
import 'package:fluttertemplate/core/services/url_service.dart';
import 'package:fluttertemplate/ui/views/home/home_view/home.dart';
import 'package:fluttertemplate/ui/views/login/login_phone_view.dart';
import 'package:fluttertemplate/ui/views/login/login_view.dart';
import 'package:fluttertemplate/ui/views/product_detail/product_detail_view.dart';
import 'package:fluttertemplate/ui/views/register/register_view.dart';
import 'package:fluttertemplate/ui/views/start_up/start_up_view.dart';
import 'package:fluttertemplate/ui/views/update/update_view.dart';
import 'package:fluttertemplate/ui/widgets/dialogs/info_alert/info_alert_dialog.dart';
import 'package:fluttertemplate/ui/widgets/notice/notice_sheet.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// document: https://stacked.filledstacks.com/docs/in-depth/service-locator
// example: https://github.com/Stacked-Org/stacked/blob/9f88465576f3e40c22c82da0500704919476a47a/example/router_example/lib/app/app.dart#L82

//  Using StackedApp for state management, generating routes and dependency injection.
@StackedApp(
  routes: [
    MaterialRoute(page: StartUpView, initial: true),
    MaterialRoute(page: UpdateView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: LoginPhoneView),
    MaterialRoute(page: RegisterView),
    MaterialRoute(page: ProductDetailView),
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
    InitializableSingleton(classType: LocalStorageService),
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality(除了附加注释之外，没有任何用途) **/
}
