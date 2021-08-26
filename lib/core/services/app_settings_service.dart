import 'package:app_settings/app_settings.dart';
import 'package:fluttertemplate/core/app/app.logger.dart';

class AppSettingsService {
  final _log = getLogger('AppSettingsServiceImpl');

  Future<void> openAppSettings() {
    _log.v('openAppSettings');
    return AppSettings.openAppSettings();
  }
}
