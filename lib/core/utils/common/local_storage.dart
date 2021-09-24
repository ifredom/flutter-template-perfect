import 'package:fluttertemplate/core/app/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class LocalStorage {
  final _sharedPrefs = locator<SharedPreferences>();

  Future<void> set<T>(String key, T content) async {
    if (content is String) {
      await _sharedPrefs.setString(key, content);
    }
    if (content is bool) {
      await _sharedPrefs.setBool(key, content);
    }
    if (content is int) {
      await _sharedPrefs.setInt(key, content);
    }
    if (content is double) {
      await _sharedPrefs.setDouble(key, content);
    }
    if (content is List<String>) {
      await _sharedPrefs.setStringList(key, content);
    }
  }

  dynamic get(String key) {
    final value = _sharedPrefs.get(key);
    return value;
  }

  remove(String key) async {
    await _sharedPrefs.remove(key);
  }

  clear() async {
    await _sharedPrefs.clear();
  }
}
