import 'package:flushbar/flushbar.dart';
import 'package:template/core/model/snack_bar_request/confirm_snack_bar_request.dart';
import 'package:template/core/model/snack_bar_request/snack_bar_request.dart';
import 'package:template/core/model/snack_bar_response/confirm_snack_bar_response.dart';
import 'package:template/locator.dart';
import 'package:template/core/services/snackbar/snack_bar_service.dart';
import 'package:flutter/material.dart';

/// Manager that is responsible for showing SnackBar/Flush bar that
/// the [SnackBarService] requests.
class SnackBarManager extends StatefulWidget {
  final Widget child;
  SnackBarManager({Key key, this.child}) : super(key: key);

  _SnackBarManagerState createState() => _SnackBarManagerState();
}

class _SnackBarManagerState extends State<SnackBarManager> {
  SnackBarService _snackBarService = locator<SnackBarService>();

  @override
  void initState() {
    super.initState();
    _snackBarService.registerSnackBarListener(_showSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _showSnackBar(SnackBarRequest request) {
    if (request is ConfirmSnackBarRequest) {
      _showConfirmSnackBar(request);
    }
  }

  void _showConfirmSnackBar(ConfirmSnackBarRequest request) {
    Flushbar(
      // There is also a messageText property for when you want to
      // use a Text widget and not just a simple String
      flushbarPosition: FlushbarPosition.TOP,
      message: request.message,
      margin: const EdgeInsets.all(8),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      borderRadius: 8,
      // Even the button can be styled to your heart's content
      mainButton: FlatButton(
        child: Text(
          request.buttonText,
          style: TextStyle(color: Theme.of(context).accentColor),
        ),
        onPressed: () {
          _snackBarService.snackBarComplete(
            ConfirmSnackBarResponse((a) => a..confirmed = true),
          );
          if (request.onPressed != null) {
            request.onPressed();
          }
        },
      ),
      // Show it with a cascading operator
    )..show(context);
  }
}
