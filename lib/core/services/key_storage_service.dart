import 'dart:convert';

import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class KeyStorageService {
  final _sharedPrefs = locator<SharedPreferences>();

  Future<void> set<T>(String key, T value) async {
    if (value is String) {
      await _sharedPrefs.setString(key, value);
    }
    if (value is bool) {
      await _sharedPrefs.setBool(key, value);
    }
    if (value is int) {
      await _sharedPrefs.setInt(key, value);
    }
    if (value is double) {
      await _sharedPrefs.setDouble(key, value);
    }
    if (value is List<String>) {
      await _sharedPrefs.setStringList(key, value);
    }
  }

  // 注意：返回值是dynamic，允许为空！

  dynamic get<T>(String key) {
    final value = _sharedPrefs.get(key);
    return value;
  }

  remove(String key) async {
    await _sharedPrefs.remove(key);
  }

  getList(String key) async {
    return _sharedPrefs.getStringList(key);
  }

  setList(String key, List<dynamic> list) async {
    List<String> items = [];
    list.forEach((item) {
      items..add(json.encode(item));
    });
    await _sharedPrefs.setStringList(key, items);
  }

  setMap(String key, value) async {
    return _sharedPrefs.setString(key, json.encode(value));
  }

  getMap(String key) async {
    return json.decode(_sharedPrefs.get(key).toString());
  }

  getListStr(String key) async {
    return _sharedPrefs.getStringList(key);
  }

  setListStr(String key, List<String> list) async {
    await _sharedPrefs.setStringList(key, list);
  }

  clear() async {
    await _sharedPrefs.clear();
  }
}
