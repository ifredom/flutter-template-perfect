import 'package:shared_preferences/shared_preferences.dart';

import 'local_storage_service.dart';

class LocalStorageServiceImpl implements LocalStorageService {
  static late LocalStorageServiceImpl _instance;
  static late SharedPreferences _preferences;
  static const notifications_key = 'notifications_key';

  static Future<LocalStorageServiceImpl> getInstance() async {
    _instance = LocalStorageServiceImpl();
    _preferences = await SharedPreferences.getInstance();
    return Future.value(_instance);
  }

  @override
  bool get hasNotificationsEnabled => get(notifications_key) ?? false;
  set hasNotificationsEnabled(bool value) => set(notifications_key, value);

  void set<T>(String key, T content) async {
    if (content is String) {
      await _preferences.setString(key, content);
    }
    if (content is bool) {
      await _preferences.setBool(key, content);
    }
    if (content is int) {
      await _preferences.setInt(key, content);
    }
    if (content is double) {
      await _preferences.setDouble(key, content);
    }
    if (content is List<String>) {
      await _preferences.setStringList(key, content);
    }
  }

  // 注意：返回值是dynamic，允许为空！
  dynamic get<T>(String key) async {
    final value = _preferences.get(key);
    return value;
  }

  Future<bool> remove(String key) async {
    final value = await _preferences.remove(key);
    return value;
  }

  clear() async {
    await _preferences.clear();
  }
}
