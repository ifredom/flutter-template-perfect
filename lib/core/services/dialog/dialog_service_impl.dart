import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:template/core/model/alert_request/alert_request.dart';
import 'package:template/core/model/alert_response/alert_response.dart';
import 'dialog_service.dart';

/// A service that is responsible for returning future dialogs
class DialogServiceImpl implements DialogService {
  final _dialogNavigationKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get dialogNavigationKey => _dialogNavigationKey;

  Function(AlertRequest) _showDialogListener;
  Completer<AlertResponse> _dialogCompleter;

  @override
  void registerDialogListener(Function(AlertRequest) showDialogListener) {
    _showDialogListener = showDialogListener;
  }

  @override
  Future<AlertResponse> showDialog(AlertRequest alertRequest) {
    _dialogCompleter = Completer<AlertResponse>();

    _showDialogListener(alertRequest);

    return _dialogCompleter.future;
  }

  @override
  void dialogComplete(AlertResponse response) {
    _dialogNavigationKey.currentState.pop();
    _dialogCompleter.complete(response);
    _dialogCompleter = null;
  }
}
