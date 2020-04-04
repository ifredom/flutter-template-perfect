import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:template/core/model/snack_bar_request/snack_bar_request.dart';
import 'package:template/core/model/snack_bar_response/snack_bar_response.dart';
import 'package:template/core/services/snackbar/snack_bar_service.dart';

/// A service that is responsible for returning future snackbar
class SnackBarServiceImpl implements SnackBarService {
  final _snackBarNavigationKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get snackBarNavigationKey => _snackBarNavigationKey;

  Function(SnackBarRequest) _showSnackBarListener;
  Completer<SnackBarResponse> _snackBarCompleter;

  @override
  void registerSnackBarListener(
      Function(SnackBarRequest) showSnackBarListener) {
    _showSnackBarListener = showSnackBarListener;
  }

  @override
  Future<SnackBarResponse> showSnackBar(SnackBarRequest snackBarRequest) {
    _snackBarCompleter = Completer<SnackBarResponse>();

    _showSnackBarListener(snackBarRequest);

    return _snackBarCompleter.future;
  }

  @override
  void snackBarComplete(SnackBarResponse response) {
    _snackBarNavigationKey.currentState.pop();
    _snackBarCompleter.complete(response);
    _snackBarCompleter = null;
  }
}
