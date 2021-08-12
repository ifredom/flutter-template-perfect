// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:connectivity/connectivity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../ui/views/home/home_view/home_view_model.dart';
import '../services/auth_service.dart';
import '../services/connectivity_service.dart';
import '../services/environment_service.dart';
import '../services/hardware_info_service.dart';
import '../services/key_storage_service.dart';
import '../services/share_service.dart';
import '../services/url_service.dart';
import '../utils/common/file_helper.dart';
import 'injection.dart';

final locator = StackedLocator.instance;

Future setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  final environmentService = await EnvironmentService.getInstance();
  locator.registerSingleton(environmentService);

  final packageInjection = await PackageInjection.getInstance();
  locator.registerSingleton(packageInjection);

  final sharedPreferences = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPreferences);

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => Connectivity());
  locator.registerLazySingleton(() => ConnectivityService());
  locator.registerLazySingleton(() => OpenLinkService());
  locator.registerLazySingleton(() => ShareService());
  locator.registerLazySingleton(() => HardwareInfoService());
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());
  locator.registerLazySingleton(() => KeyStorageService());
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => HomeViewModel());
}
