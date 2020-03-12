import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences 本地存储
class LocalStorage {
  static clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static set(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  static get(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key);
  }

  static remove(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static getList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  static setList(String key, List<dynamic> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> items = [];
    list.forEach((item) {
      items..add(json.encode(item));
    });
    prefs.setStringList(key, items);
  }

  static setMap(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(key, json.encode(value));
  }

  static getMap(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return json.decode(prefs.get(key));
  }

  static getListStr(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  static setListStr(String key, List<String> list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(key, list);
  }
}
