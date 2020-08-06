import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:template/core/localization/localization.dart';
import './settings_view_model.dart';


/// An example settings view that uses platform adaptive widgets
/// and builds widgets using the `provider_architecture` package,
class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);

    return ViewModelBuilder<SettingsViewModel>.nonReactive(
      viewModelBuilder: () => SettingsViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(local.settingsViewTitle),
        ),
        body: ListView(
          children: <Widget>[
            _AppSettingsListTile(),
            _NotificationsListTile(),
            _ShowSnackBarListTile(),
            _SignOutListTile()
          ],
        ),
      ),
    );
  }
}

class _AppSettingsListTile extends ViewModelWidget<SettingsViewModel> {
  const _AppSettingsListTile({Key key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return PlatformWidget(
      android: (_) => ListTile(
        title: Text(local.settingsViewAppSettings),
        subtitle: Text(local.settingsViewAppSettingsDesc),
        trailing: PlatformWidget(
          android: (_) => Icon(Icons.launch),
          ios: (_) => Icon(CupertinoIcons.share_up),
        ),
        onTap: model.openAppSettings,
      ),
      ios: (_) => CupertinoButton(
        onPressed: model.openAppSettings,
        child: Row(
          children: <Widget>[
            Text(
              local.settingsViewAppSettings,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            Spacer(),
            PlatformWidget(
              android: (_) => Icon(Icons.launch),
              ios: (_) => Icon(CupertinoIcons.share_up),
            ),
          ],
        ),
      ),
    );
  }
}

class _NotificationsListTile extends ViewModelWidget<SettingsViewModel> {
  const _NotificationsListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return PlatformWidget(
      android: (_) => ListTile(
        onTap: model.toggleNotificationsEnabled,
        title: Text(local.settingsViewNotifications),
        subtitle: Text(local.settingsViewNotificationsDesc),
        trailing: Switch.adaptive(
          value: model.notificationsEnabled,
          onChanged: (_) => model.toggleNotificationsEnabled(),
        ),
      ),
      ios: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Text(
              local.settingsViewNotifications,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            Spacer(),
            Switch.adaptive(
              value: model.notificationsEnabled,
              onChanged: (_) => model.toggleNotificationsEnabled(),
            ),
          ],
        ),
      ),
    );
  }
}

class _SignOutListTile extends ViewModelWidget<SettingsViewModel> {
  const _SignOutListTile({Key key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return PlatformWidget(
      android: (_) => ListTile(
        title: Text(local.settingsViewSignOut),
        subtitle: Text(local.settingsViewSignOutDesc),
        trailing: PlatformWidget(
          android: (_) => Icon(Icons.exit_to_app),
          ios: (_) => Icon(CupertinoIcons.right_chevron),
        ),
        onTap: model.signOut,
      ),
      ios: (_) => CupertinoButton(
        onPressed: model.signOut,
        child: Row(
          children: <Widget>[
            Text(
              local.settingsViewSignOut,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            Spacer(),
            PlatformWidget(
              android: (_) => Icon(Icons.exit_to_app),
              ios: (_) => Icon(CupertinoIcons.right_chevron),
            ),
          ],
        ),
      ),
    );
  }
}

class _ShowSnackBarListTile extends ViewModelWidget<SettingsViewModel> {
  const _ShowSnackBarListTile({Key key}) : super(key: key, reactive: false);

  @override
  Widget build(BuildContext context, SettingsViewModel model) {
    final local = AppLocalizations.of(context);

    return PlatformWidget(
      android: (_) => ListTile(
        title: Text(local.settingsViewSnackBar),
        subtitle: Text(local.settingsViewSnackBarDesc),
        trailing: Icon(Icons.announcement),
        onTap: model.showSnackbar,
      ),
      ios: (_) => CupertinoButton(
        onPressed: model.showSnackbar,
        child: Row(
          children: <Widget>[
            Text(
              local.settingsViewSnackBar,
              style: CupertinoTheme.of(context).textTheme.textStyle,
            ),
            Spacer(),
            Icon(CupertinoIcons.conversation_bubble),
          ],
        ),
      ),
    );
  }
}
