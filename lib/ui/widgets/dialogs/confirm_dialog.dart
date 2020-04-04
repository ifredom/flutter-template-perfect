import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ConfirmDialog extends StatelessWidget {
  final VoidCallback onDenied;
  final VoidCallback onConfirmed;
  final String title;
  final String description;
  final String buttonTitle;

  const ConfirmDialog({
    Key key,
    @required this.title,
    @required this.description,
    @required this.onDenied,
    @required this.onConfirmed,
    this.buttonTitle,
  })  : assert(title != null),
        assert(description != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (onDenied != null) {
          onDenied();
        }
        return false;
      },
      child: PlatformAlertDialog(
        title: Text(title),
        content: Text(description),
        actions: <Widget>[
          PlatformDialogAction(
            child: Text('取消'),
            onPressed: () {
              if (onDenied != null) {
                onDenied();
              }
            },
          ),
          PlatformDialogAction(
            ios: (_) => CupertinoDialogActionData(isDestructiveAction: true),
            child: Text(buttonTitle ?? '确认'),
            onPressed: () {
              if (onDenied != null) {
                onConfirmed();
              }
            },
          ),
        ],
      ),
    );
  }
}
