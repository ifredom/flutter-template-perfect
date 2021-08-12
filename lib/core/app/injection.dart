import 'package:package_info/package_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PackageInjection {
  /// Injects the regular [PackageInfo] instance instead of [Future]
  static Future<PackageInfo> getInstance() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo;
  }
}

class SharedPrefsInjection {
  /// Injects the regular [SharedPreferences] instance instead of [Future]
  static Future<SharedPreferences> getInstance() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences;
  }
}
