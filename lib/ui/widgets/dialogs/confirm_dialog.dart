import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';
import '../custom/base_dialog_wrapper.dart';

class ConfirmDialog extends StatelessWidget {
  final DialogRequest dialogRequest;
  final Function(DialogResponse) onDialogTap;
  final VoidCallback onDenied;
  final VoidCallback onConfirmed;
  final String title;
  final Widget content;
  final String buttonTitle;
  final double width;
  final double height;

  const ConfirmDialog({
    Key key,
    this.dialogRequest,
    this.onDialogTap,
     this.title,
     this.content,
    this.onDenied,
    this.onConfirmed,
    this.buttonTitle,
    this.width,
    this.height,
  })  : assert(title != null),
        assert(content != null),
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
      child: BaseDialogWrapper(
        title: title,
        width: width ?? ScreenUtil().screenWidth * 0.382,
        height: height ?? ScreenUtil().screenHeight * 0.4,
        child: Center(
          child: content,
        ),
        onDenied: () {
          onDenied();
        },
        onConfirmed: () {
          onConfirmed();
        },
      ),
    );
  }
}
