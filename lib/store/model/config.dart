import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeInfo {
  bool isDart;

  ThemeInfo({this.isDart});
}

class LocalInfo {
  int localIndex;

  LocalInfo({this.localIndex});
}

class ConfigModel with ChangeNotifier {
  ThemeInfo _themeInfo = ThemeInfo(isDart: false);
  LocalInfo _localInfo = LocalInfo(localIndex: 0);

  bool get colorInt => _themeInfo.isDart;

  int get localIndex => _localInfo.localIndex;

  bool getTheme() {
    /// 获取localstorage中theme的值
    return true;
  }

  String getThemeText() {
    return getTheme() ? "夜间模式" : "日间模式";
  }

  Future<void> setTheme(bool isDart) async {
    /// SP保存theme值
    // SpUtil.putBool('config_theme_color', isDart);

    _themeInfo.isDart = isDart;

    notifyListeners();
  }

  int getLocal() {
    // return SpUtil.getInt('config_local', defValue: localIndex);
    return 1;
  }

  Future<void> setLocal(localIndex) async {
    /// SP保存theme值
    // SpUtil.putInt('config_local', localIndex);

    _localInfo.localIndex = localIndex;

    notifyListeners();
  }
}

/// 枚举: 支持的语言种类
enum SupportLocale {
  FOLLOW_SYSTEM,
  SIMPLIFIED_CHINESE,
  TRADITIONAL_CHINESE_TW,
  TRADITIONAL_CHINESE_HK,
  ENGLISH
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
