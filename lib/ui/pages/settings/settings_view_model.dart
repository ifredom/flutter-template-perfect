import 'package:logging/logging.dart';
import 'package:stacked/stacked.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/model/alert_request/confirm_alert_request.dart';
import 'package:template/core/model/alert_response/confirm_alert_response.dart';
import 'package:template/core/model/snack_bar_request/confirm_snack_bar_request.dart';
import 'package:template/core/routes/routers.dart';
import 'package:template/core/utils/res/local_keys.dart';
import 'package:template/core/services/dialog/dialog_service.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/services/key_storage/key_storage_service.dart';
import 'package:template/core/services/app_settings/app_settings_service.dart';
import 'package:template/core/services/snackbar/snack_bar_service.dart';
class SettingsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _keyStorageService = locator<KeyStorageService>();
  final _snackBarService = locator<SnackBarService>();
  final _appSettingsService = locator<AppSettingsService>();
  final _log = Logger('SettingsViewModel');

  bool _notificationsEnabled = false;
  bool get notificationsEnabled => _notificationsEnabled;

  Future<void> init() async {
    _notificationsEnabled = _keyStorageService.hasNotificationsEnabled;
    notifyListeners();
  }

  Future<void> openAppSettings() async {
    _log.fine('User has opened app settings');
    await _appSettingsService.openAppSettings();
  }

  Future<void> signOut() async {
    final alertRequest = ConfirmAlertRequest(
      (r) => r
        ..title = LocalKeys.settings_view_sign_out
        ..description = LocalKeys.settings_view_sign_out_desc
        ..buttonTitle = LocalKeys.button_confirm,
    );
    final ConfirmAlertResponse dialogResult =
        await _dialogService.showDialog(alertRequest);

    if (dialogResult.confirmed) {
      _log.fine('User has signed out');
      await _authService.signOut();
      await _navigationService.popAllAndPushNamed(ViewRoutes.loginPage);
    }
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
