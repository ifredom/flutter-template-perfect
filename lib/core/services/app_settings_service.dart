import 'package:app_settings/app_settings.dart';
import 'package:logging/logging.dart';

class AppSettingsService {
  final _log = Logger('AppSettingsServiceImpl');

  Future<void> openAppSettings() {
    _log.finer('openAppSettings');
    return AppSettings.openAppSettings();
  }
}
