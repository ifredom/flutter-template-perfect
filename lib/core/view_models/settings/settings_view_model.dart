import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:template/core/enums/view_state.dart';
import 'package:template/core/model/alert_request/confirm_alert_request.dart';
import 'package:template/core/model/alert_response/confirm_alert_response.dart';
import 'package:template/core/model/snack_bar_request/confirm_snack_bar_request.dart';
import 'package:template/core/routes/routers.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/services/dialog/dialog_service.dart';
import 'package:template/core/services/key_storage/key_storage_service.dart';
import 'package:template/core/view_models/config_view_model.dart';
import 'package:template/core/view_models/userinfo_view_model.dart';
import 'package:template/locator.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/core/services/snackbar/snack_bar_service.dart';
import 'package:template/core/utils/common/logger.dart';
import 'package:template/core/utils/res/local_keys.dart';
import 'package:template/ui/pages/setting/setting_pay_bind.dart';
import 'package:template/ui/pages/setting/setting_piano_keyboard.dart';
import 'package:template/ui/pages/setting/setting_reset_password.dart';
import 'package:template/ui/pages/setting/setting_voice.dart';

import '../base_view_model.dart';

class SettingsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();

  final _keyStorageService = locator<KeyStorageService>();
  final _snackBarService = locator<SnackBarService>();
  final _configViewModel = locator<ConfigViewModel>();
  final _userinfoViewModel = locator<UserinfoViewModel>();

  bool _notificationsEnabled = false;
  bool get notificationsEnabled => _notificationsEnabled;

  // 音量开关
  bool _voiceSwitchSelected = true;
  bool get voiceSwitchSelected => _voiceSwitchSelected;
  // 音量数值
  double _voiceProgressValue = 0.0;
  double get voiceProgressValue => _voiceProgressValue;
  // 键盘开关
  bool _keyboardSwitchSelected = true;
  bool get keyboardSwitchSelected => _keyboardSwitchSelected;

  /// 密码是否设置
  bool _hasSetPassword = false;
  bool get hasSetPassword => _hasSetPassword;

  /// 菜单
  num _activeMenuIndex = 0;
  num get activeMenuIndex => _activeMenuIndex;
  List<String> _menuViewTitles = ["资料", "成就", "背包", "历程", "钱包"];
  List get menuViewTitles => _menuViewTitles;
  List<Widget> _menuViewlist = [];
  List get menuViewlist => _menuViewlist;

  Future<void> init() async {
    setState(ViewState.Busy);
    _notificationsEnabled = _keyStorageService.hasNotificationsEnabled;

    _hasSetPassword =
        _authService.currentUser.isSetPwd == 1 ? true : false; // 1已设置, 2未设置

    _menuViewlist
      ..add(SettingVoice())
      ..add(SettingPianoKeyboard())
      ..add(SettingPayBind())
      ..add(SettingResetPassword());

    setState(ViewState.Idle);
  }

  void openAppSettings() {
    Logger.d('打开用户设置');
    AppSettings.openAppSettings();
  }

  void setDefaultMenuIndex({num index = 0}) {
    _activeMenuIndex = index;
    notifyListeners();
  }

  void changeMenuIndex(num index) {
    _activeMenuIndex = index;
    notifyListeners();
  }

  /// 设置音量 打开/关闭
  void toggleVolumeState(bool state) {
    _voiceSwitchSelected = state;
    if (state) {
      _configViewModel.audioPlayer.start();
    } else {
      _configViewModel.audioPlayer.pause();
    }

    notifyListeners();
  }

  /// 设置音量 大小
  void setVolume(double volume) {
    _voiceProgressValue = volume;
    _configViewModel.audioPlayer.setVolume(volume);
    notifyListeners();
  }

  // 退出登录
  Future<void> signOut() async {
    final alertRequest = ConfirmAlertRequest(
      (r) => r
        ..title = '提示'
        ..description = '是否退出登录?',
    );
    final ConfirmAlertResponse dialogResult =
        await _dialogService.showDialog(alertRequest);

    if (dialogResult.confirmed) {
      Logger.d('用户已退出');
      await _authService.signOut();
      await _navigationService.popAllAndPushNamed(RoutesUtils.loginPage);
    }

    return Future.value(true);
  }

  void toggleNotificationsEnabled() {
    _notificationsEnabled = !_notificationsEnabled;
    _keyStorageService.hasNotificationsEnabled = _notificationsEnabled;
    notifyListeners();
  }

  // Snack bar Sample usage
  Future<void> showSnackbar() async {
    final request = ConfirmSnackBarRequest(
      (r) => r
        ..message = LocalKeys.snackbar_message
        ..buttonText = LocalKeys.snackbar_action,
    );
    await _snackBarService.showSnackBar(request);
  }
}
