import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/core/enums/component_state.dart';
import 'package:template/core/model/config.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';

class ConfigViewModel extends BaseViewModel {
  ThemeInfo _themeInfo = ThemeInfo(isDart: false);
  String get theme => _themeInfo.theme;


  Future getTheme() async {
    String _theme = await LocalStorage.get(LocalStorageKeys.THEME);
    print('config get Theme $_theme');
    if (_theme != null) {
      setTheme(_theme);
    }
  }

  Future<void> setTheme(String themeMode) async {
    _themeInfo.theme = themeMode;
    await LocalStorage.set(LocalStorageKeys.THEME, themeMode);

    notifyListeners();
  }
}

/// SupportLocale -> locale
Map<SupportLocale, Locale> mapLocales = {
  SupportLocale.FOLLOW_SYSTEM: null,
  SupportLocale.SIMPLIFIED_CHINESE: Locale("zh", "CN"),
  SupportLocale.TRADITIONAL_CHINESE_TW: Locale("zh", "TW"),
  SupportLocale.TRADITIONAL_CHINESE_HK: Locale("zh", "HK"),
  SupportLocale.ENGLISH: Locale("en", "")
};

/// SupportLocale 对应的含义
Map<SupportLocale, String> get mapSupportLocale => {
      SupportLocale.FOLLOW_SYSTEM: "跟随系统",
      SupportLocale.SIMPLIFIED_CHINESE: "简体中文",
      SupportLocale.TRADITIONAL_CHINESE_TW: "繁體中文(臺灣)",
      SupportLocale.TRADITIONAL_CHINESE_HK: "繁體中文(香港)",
      SupportLocale.ENGLISH: "English"
    };
