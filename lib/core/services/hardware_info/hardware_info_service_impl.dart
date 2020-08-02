import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:logging/logging.dart';
import 'hardware_info_service.dart';

/// Service that is responsible for getting hardware device info
class HardwareInfoServiceImpl implements HardwareInfoService {
  final _log = Logger("HardwareInfoServiceImpl");
  String _operatingSystem;
  String _device;
  String _udid;

  @override
  String get operatingSystem => _operatingSystem;

  @override
  String get device => _device;

  @override
  String get udid => _udid;

  @override
  Future<void> init() async {
    final deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      _udid = iosInfo.identifierForVendor;
      _operatingSystem = 'iOS';
      _device = iosInfo.utsname.machine;
    } else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      _udid = androidInfo.androidId;
      _operatingSystem = 'Android';
      _device = androidInfo.model;
    }

    _log.info('udid: $_udid');
    _log.info('operating_system: $_operatingSystem');
    _log.info('device: $_device');
  }
}
