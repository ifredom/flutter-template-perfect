import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;
  static const notifications_key = 'notifications_key';

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  bool get hasNotificationsEnabled => get<bool>(notifications_key) ?? false;
  set hasNotificationsEnabled(bool value) => set(notifications_key, value);

  void set<T>(String key, dynamic content) async {
    if (T is String) {
      await _preferences!.setString(key, content);
    }
    if (T is bool) {
      await _preferences!.setBool(key, content);
    }
    if (T is int) {
      await _preferences!.setInt(key, content);
    }
    if (T is double) {
      await _preferences!.setDouble(key, content);
    }
    if (T is List<String>) {
      await _preferences!.setStringList(key, content);
    }
  }

  // The return value is dynamic and can be null!
  // 注意：返回值是dynamic，允许为空！
  bool? getBool(String key) {
    return _preferences?.getBool(key);
  }

  String? getString(String key) {
    return _preferences?.getString(key);
  }

  double? getDouble(String key) {
    return _preferences?.getDouble(key);
  }

  dynamic get<T>(String key) async {
    print(T);
    print(T is bool);
    print(T == bool);
    var value;
    if (T == String) {
      value = _preferences!.getString(key);
    } else if (T == bool) {
      value = _preferences!.getBool(key);
      print("值");
      print(value);
    } else if (T == double) {
      value = _preferences!.getDouble(key);
    } else if (T == double) {
      value = _preferences!.getDouble(key);
    } else {
      value = _preferences!.get(key);
    }
    return value;
  }

  Future<bool> remove(String key) async {
    final value = await _preferences!.remove(key);
    return value;
  }

  clear() async {
    await _preferences!.clear();
  }
}
