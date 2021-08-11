import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Service that is responsible for storing/retrieving data in/from
/// local storage using the [SharedPreferences] package.
class KeyStorageService {
  final _log = Logger("KeyStorageService");
  static const notifications_key = 'notifications_key';

  static KeyStorageService _instance = KeyStorageService();
  static SharedPreferences _preferences = SharedPreferences.getInstance() as SharedPreferences;

  static Future<KeyStorageService> getInstance() => Future.value(_instance);

  bool get hasNotificationsEnabled => _getFromDisk(notifications_key) ?? false;

  set hasNotificationsEnabled(bool value) => _saveToDisk(notifications_key, value);

  dynamic _getFromDisk(String key) {
    final value = _preferences.get(key);

    _log.info('LocalStorageService: (Fetching) key: $key value: $value');

    return value;
  }

  void _saveToDisk<T>(String key, T content) {
    _log.info('LocalStorageService: (Saving) key: $key value: $content');

    if (content is String) {
      _preferences.setString(key, content);
    }
    if (content is bool) {
      _preferences.setBool(key, content);
    }
    if (content is int) {
      _preferences.setInt(key, content);
    }
    if (content is double) {
      _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences.setStringList(key, content);
    }
  }
}
