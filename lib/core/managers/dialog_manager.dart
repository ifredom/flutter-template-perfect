import 'package:flutter/material.dart';
import 'package:template/core/localization/localization.dart';
import 'package:template/core/model/alert_request/alert_request.dart';
import 'package:template/core/model/alert_request/confirm_alert_request.dart';
import 'package:template/core/model/alert_response/confirm_alert_response.dart';
import 'package:template/core/services/dialog/dialog_service.dart';
import 'package:template/locator.dart';
import 'package:template/ui/widgets/dialogs/confirm_dialog.dart';

/// Manager that is responsible for showing dialogs that
/// the [DialogService] requests.
class DialogManager extends StatefulWidget {
  final Widget child;

  const DialogManager({Key key, this.child}) : super(key: key);

  _DialogManagerState createState() => _DialogManagerState();
}

class _DialogManagerState extends State<DialogManager> {
  final _dialogService = locator<DialogService>();

  @override
  void initState() {
    super.initState();
    _dialogService.registerDialogListener(_showDialog);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showDialog(AlertRequest request) {
    if (request is ConfirmAlertRequest) {
      _showConfirmAlert(request);
    }
    // Check for different alerts like an alert with a form
    // that requires different request options
  }

  void _showConfirmAlert(ConfirmAlertRequest request) {
    final local = AppLocalizations.of(context);

    showDialog(
      context: context,
      builder: (context) => ConfirmDialog(
        title: request.title,
        description: request.description,
        buttonTitle: request.buttonTitle,
        onConfirmed: () => _dialogService.dialogComplete(
          ConfirmAlertResponse((a) => a..confirmed = true),
        ),
        onDenied: () => _dialogService.dialogComplete(
          ConfirmAlertResponse((a) => a..confirmed = false),
        ),
      ),
    );
  }
}
