import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/services/auth/auth_service_impl.dart';
import 'package:template/core/services/connectivity/connectivity_service.dart';
import 'package:template/core/services/connectivity/connectivity_service_impl.dart';
import 'package:template/core/services/dialog/dialog_service.dart';
import 'package:template/core/services/dialog/dialog_service_impl.dart';
import 'package:template/core/services/hardware_info/hardware_info_service.dart';
import 'package:template/core/services/hardware_info/hardware_info_service_impl.dart';
import 'package:template/core/services/key_storage/key_storage_service.dart';
import 'package:template/core/services/key_storage/key_storage_service_impl.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/core/services/navigation/navigation_service_impl.dart';
import 'package:template/core/services/snackbar/snack_bar_service.dart';
import 'package:template/core/services/snackbar/snack_bar_service_impl.dart';
import 'package:template/core/utils/common/file_helper.dart';
import 'package:template/ui/pages/home/home_view_model.dart';

GetIt locator = GetIt.instance;


// explam: https://github.com/awesome-tips/Flutter-Tips/blob/7215ac5bc4888aca46f9e146f711479d975c9fe3/articles/Flutter%20%20%E9%80%9A%E8%BF%87%20ServiceLocator%20%E5%AE%9E%E7%8E%B0%E6%97%A0%20context%20%E5%AF%BC%E8%88%AA.md
Future<void> setupLocator({bool test = false}) async {
  // Services
  locator.registerLazySingleton<NavigationService>(
    () => NavigationServiceImpl(),
  );
  locator.registerLazySingleton<HardwareInfoService>(
    () => HardwareInfoServiceImpl(),
  );
  locator.registerLazySingleton<ConnectivityService>(
    () => ConnectivityServiceImpl(),
  );
  locator.registerLazySingleton<DialogService>(() => DialogServiceImpl());
  locator.registerLazySingleton<SnackBarService>(() => SnackBarServiceImpl());

  // http data sources
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());

  // Home page data
  locator.registerLazySingleton<HomeViewModel>(() => HomeViewModel());


  // Repositories

  if (!test) {
    await _setupSharedPreferences();
  }

  // Utils
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());

  // External
  locator.registerLazySingleton<HiveInterface>(() => Hive);
}

Future<void> _setupSharedPreferences() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerLazySingleton<KeyStorageService>(() => instance);
}
