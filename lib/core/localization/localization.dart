import 'dart:convert';

import 'package:fluttertemplate/core/constants/component_state.dart';
import 'package:fluttertemplate/core/localization/setup_local.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';
import 'package:fluttertemplate/core/utils/res/locale_keys.dart';

class AppLocalizations {
  final Locale locale = Locale('zh', 'en');

  Map<String, String> _sentences = {};

  AppLocalizations(locale);

  static AppLocalizations? of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations);

  Future<bool> load() async {
    final path = 'assets/lang/${locale.languageCode}.json';
    final data = await rootBundle.loadString(path);
    final Map<String, dynamic> _result = json.decode(data);

    _sentences = <String, String>{};
    _result.forEach((String key, dynamic value) {
      _sentences[key] = value.toString();
    });

    return true;
  }

  String? translate(String key) {
    return _sentences[key];
  }

  // List of available local strings that the app can use
  //  - translated from the corresponding /assets/lang/<local>.json files
  String? get appTitle => translate(LocalKeys.app_title);

  String? get invalidPostalIdcard => translate(LocalKeys.invalid_postal_idcard);

  String? get confirmDialogTitle => translate(LocalKeys.confirm_dialog_title);

  String? get homeViewTitle => translate(LocalKeys.home_view_title);
  String? get homeViewNoPosts => translate(LocalKeys.home_view_no_posts);

  String? get settingsViewTitle => translate(LocalKeys.settings_view_title);
  String? get settingsViewPermissions => translate(LocalKeys.settings_view_permissions);
  String? get settingsViewPermissionsDesc => translate(LocalKeys.settings_view_permissions_desc);
  String? get settingsViewAppSettings => translate(LocalKeys.settings_view_app_settings);
  String? get settingsViewAppSettingsDesc => translate(LocalKeys.settings_view_app_settings_desc);
  String? get settingsViewNotifications => translate(LocalKeys.settings_view_notifications);
  String? get settingsViewNotificationsDesc => translate(LocalKeys.settings_view_notifications_desc);
  String? get settingsViewLocation => translate(LocalKeys.settings_view_location);
  String? get settingsViewSignOut => translate(LocalKeys.settings_view_sign_out);
  String? get settingsViewSignOutDesc => translate(LocalKeys.settings_view_sign_out_desc);
  String? get settingsViewSnackBar => translate(LocalKeys.settings_view_snack_bar);
  String? get settingsViewSnackBarDesc => translate(LocalKeys.settings_view_snack_bar_desc);

  String? get loginViewTitle => translate(LocalKeys.login_view_title);
  String? get loginButton => translate(LocalKeys.login_button);

  String? get buttonCancel => translate(LocalKeys.button_cancel);
  String? get buttonConfirm => translate(LocalKeys.button_confirm);

  String? get emailHint => translate(LocalKeys.email_hint);
  String? get passwordHint => translate(LocalKeys.password_hint);

  // Validators
  String? get invalidEmail => translate(LocalKeys.invalid_email);
  String? get invalidPhoneNumber => translate(LocalKeys.invalid_phone_number);
  String? get invalidZipCode => translate(LocalKeys.invalid_zip_code);
  String? get passwordEmpty => translate(LocalKeys.password_empty);
  String? get passwordShort => translate(LocalKeys.password_short);

  String? get snackbarMessage => translate(LocalKeys.snackbar_message);
  String? get snackbarAction => translate(LocalKeys.snackbar_action);
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return supportedLocalCodes.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class FallbackCupertinoLocalizationsDelegate extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return supportedLocalCodes.contains(locale.languageCode);
  }

  @override
  Future<CupertinoLocalizations> load(Locale locale) {
    return DefaultCupertinoLocalizations.load(locale);
  }

  @override
  bool shouldReload(FallbackCupertinoLocalizationsDelegate old) => false;
}

/// SupportLocale -> locale
Map<SupportLocale, Locale> mapLocales = {
  SupportLocale.FOLLOW_SYSTEM: Locale("zh", "CN"),
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
      SupportLocale.ENGLISH: "English",
    };
