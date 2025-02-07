// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../services/auth_service.dart';
import '../services/connectivity_service.dart';
import '../services/file_helper.dart';
import '../services/hardware_info_service.dart';
import '../services/local_storage_service.dart';
import '../services/share_service.dart';
import '../services/url_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => Connectivity());
  locator.registerLazySingleton(() => ConnectivityService());
  locator.registerLazySingleton(() => OpenLinkService());
  locator.registerLazySingleton(() => ShareService());
  locator.registerLazySingleton(() => HardwareInfoService());
  locator.registerLazySingleton(() => FileServiceImpl());
  locator.registerLazySingleton(() => AuthService());
  final localStorageService = LocalStorageService();
  await localStorageService.init();
  locator.registerSingleton(localStorageService);
}
