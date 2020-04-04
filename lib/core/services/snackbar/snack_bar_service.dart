import 'package:flutter/widgets.dart';
import 'package:template/core/model/snack_bar_request/snack_bar_request.dart';
import 'package:template/core/model/snack_bar_response/snack_bar_response.dart';

abstract class SnackBarService {
  GlobalKey<NavigatorState> get snackBarNavigationKey;

  void registerSnackBarListener(Function(SnackBarRequest) showSnackBarListener);

  Future<SnackBarResponse> showSnackBar(SnackBarRequest alertRequest);

  void snackBarComplete(SnackBarResponse response);
}
