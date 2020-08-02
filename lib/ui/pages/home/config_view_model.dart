import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:template/core/enums/support_lang.dart';
import 'package:template/core/model/config.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';

typedef FijkVolumeCallback = void Function(FijkVolumeEvent value);

class ConfigViewModel extends BaseViewModel {
  ThemeInfo _themeInfo = ThemeInfo(isDart: false);
  String get theme => _themeInfo.theme;

  FijkPlayer _audioPlayer = FijkPlayer();
  FijkPlayer get audioPlayer => _audioPlayer;

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

  Future intPlayer({String url = 'asset:///assets/audio/bgaudio.mp3'}) async {
    audioPlayer.setDataSource(url, autoPlay: true);
    // FijkVolumeWatcher(
    //   watcher: (FijkVolumeEvent val) {},
    //   child: Text('123'),
    // );
  }

  Future setPlayerVolume({double volume}) async {
    audioPlayer.setVolume(volume);
  }

  Future disposePlayer() async {
    audioPlayer.stop();
    audioPlayer.release();
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
