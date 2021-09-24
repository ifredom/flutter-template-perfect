import 'package:connectivity/connectivity.dart';
import 'package:fluttertemplate/core/services/auth_service.dart';
import 'package:fluttertemplate/core/services/connectivity_service.dart';
import 'package:fluttertemplate/core/services/environment_service.dart';
import 'package:fluttertemplate/core/services/hardware_info_service.dart';
import 'package:fluttertemplate/core/services/share_service.dart';
import 'package:fluttertemplate/core/services/url_service.dart';
import 'package:fluttertemplate/core/utils/common/file_helper.dart';
import 'package:fluttertemplate/core/utils/common/local_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;

Future<void> setupLocator({String? environment, EnvironmentFilter? environmentFilter}) async {
  print("启动setupLocator初始化");
  // Register dependencies
  final environmentService = await EnvironmentService.getInstance();
  locator.registerSingleton(environmentService);

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => Connectivity());

  locator.registerLazySingleton(() => ConnectivityService());
  locator.registerLazySingleton(() => OpenLinkService());
  locator.registerLazySingleton(() => ShareService());
  locator.registerLazySingleton(() => HardwareInfoService());
  locator.registerLazySingleton(() => AuthService());

  // Utils
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());

  // final instance = await LocalStorage.getInstance();
  locator.registerLazySingleton(() => LocalStorage());
}

// https://github.com/fluttercommunity/get_it/issues/196
Future<void> locatorReady() async {
  await locator.allReady();
}
