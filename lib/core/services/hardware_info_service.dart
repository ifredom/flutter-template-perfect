import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:fluttertemplate/core/app/app.logger.dart';

/// Service that is responsible for getting hardware device info
class HardwareInfoService {
  final _log = getLogger("HardwareInfoService");
  String _operatingSystem = '';
  String _device = '';
  String _udid = '';

  String get operatingSystem => _operatingSystem;

  String get device => _device;

  String get udid => _udid;

  Future<void> init() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      _udid = iosInfo.identifierForVendor!;
      _operatingSystem = 'iOS';
      _device = iosInfo.utsname.machine;
    } else if (Platform.isAndroid) {
      const _androidIdPlugin = AndroidId();
      _udid = (await _androidIdPlugin.getId())!;

      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      _operatingSystem = 'Android';
      _device = androidInfo.model;
    }

    _log.i('udid: $_udid');
    _log.i('operating_system: $_operatingSystem');
    _log.i('device: $_device');
  }
}
