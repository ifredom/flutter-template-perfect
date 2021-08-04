import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pianostudent/core/model/userinfo/user.dart';
import 'package:pianostudent/core/utils/common/color_utils.dart';
import 'package:pianostudent/core/utils/res/gaps.dart';
import 'package:pianostudent/services/api/apicode/api.dart';
import 'package:pianostudent/services/api/http_service_impl.dart';
import 'package:pianostudent/services/locator.dart';
import 'package:pianostudent/services/repositories_auth/auth_service.dart';
import 'package:pianostudent/ui/widgets/buttons/gradient_button.dart';
import 'package:pianostudent/ui/widgets/textfield/text_field.dart';

import '../custom/base_dialog_wrapper.dart';

class ChangeUsernameDialog extends StatefulWidget {
  final String nickName;
  ChangeUsernameDialog({this.nickName});
  @override
  _ChangeUsernameDialogState createState() => _ChangeUsernameDialogState();
}

class _ChangeUsernameDialogState extends State<ChangeUsernameDialog> {
  final _authService = locator<AuthService>();
  FocusNode _usernameFocus = FocusNode();
  TextEditingController usernameController = TextEditingController();

  void _tappedCancel() async {
    print("点击取消");
    Navigator.pop(context);
  }

  void _tappedSure() async {
    User userStore = _authService.currentUser;
    var params = Map<String, dynamic>();
    params["id"] = userStore.id;
    params["nickName"] = usernameController.text;

    var res = await httpService.request(ApiCode.UPDATE_USERINFO, params);
    if (res.data["code"] == 0) {
      _authService.updateUserNiceName(params["nickName"]);
      showToast('修改成功');
      Navigator.pop(context);
    } else {
      showToast(res.data["msg"]);
    }
  }

  @override
  void initState() {
    super.initState();
    usernameController.text = widget.nickName;
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialogWrapper(
      title: '昵称',
      width: ScreenUtil().setWidth(734),
      height: ScreenUtil().setHeight(592),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(52), vertical: ScreenUtil().setWidth(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputField(
              focusNode: _usernameFocus,
              boxshape: Boxshape.round,
              hintText: "输入昵称",
              controller: usernameController,
              formatter: RegExp("[\u4e00-\u9fa5-Za-z0-9_]"),
              borderColor: HexToColor("#CBAEFA"),
            ),
            Text(
              '请输入1~20个字符，不能包含，。；等无效字符',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: HexToColor('#999999'),
                fontSize: ScreenUtil().setSp(24),
              ),
            ),
            Gaps.vGap120,
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(104),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GradientButton(
                    colors: [HexToColor('#C7B8E6')],
                    text: "取消",
                    onPressed: () {
                      _tappedCancel();
                    },
                  ),
                  GradientButton(
                    text: '确定',
                    colors: [HexToColor('#FF696A'), HexToColor('#FF894A')],
                    onPressed: () {
                      _tappedSure();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
