import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class LocalStorage {
  static set<T>(String key, T value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    if (value is String) {
      await _preferences.setString(key, value);
    } else if (value is bool) {
      await _preferences.setBool(key, value);
    } else if (value is int) {
      await _preferences.setInt(key, value);
    } else if (value is double) {
      await _preferences.setDouble(key, value);
    }
  }

  static dynamic get(String key) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var value = _preferences.get(key);
    return value;
  }

  static remove(String key) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.remove(key);
  }

  static getList(String key) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getStringList(key);
  }

  static setList(String key, List<dynamic> list) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    List<String> items = [];
    list.forEach((item) {
      items..add(json.encode(item));
    });
    await _preferences.setStringList(key, items);
  }

  static setMap(String key, value) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.setString(key, json.encode(value));
  }

  static getMap(String key) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return json.decode(_preferences.get(key).toString());
  }

  static getListStr(String key) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    return _preferences.getStringList(key);
  }

  static setListStr(String key, List<String> list) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setStringList(key, list);
  }

  static clear() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.clear();
  }
}
