import 'package:app_settings/app_settings.dart';
import 'package:logging/logging.dart';
import './app_settings_service.dart';

class AppSettingsServiceImpl implements AppSettingsService {
  final _log = Logger('AppSettingsServiceImpl');

  @override
  Future<void> openAppSettings() {
    _log.finer('openAppSettings');
    return AppSettings.openAppSettings();
  }
}
