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

class ChangeDescriptionDialog extends StatefulWidget {
  final String description;
  ChangeDescriptionDialog({Key key, this.description}) : super(key: key);
  @override
  _ChangeDescriptionDialogState createState() => _ChangeDescriptionDialogState();
}

class _ChangeDescriptionDialogState extends State<ChangeDescriptionDialog> {
  final _authService = locator<AuthService>();
  FocusNode _usernameFocus = FocusNode();
  TextEditingController usernameController = TextEditingController();

  void _tappedCancel() async {
    print("取消");
    Navigator.pop(context);
  }

  void _tappedSure() async {
    User userStore = _authService.currentUser;
    var params = Map<String, dynamic>();
    params["id"] = userStore.id;
    params["description"] = usernameController.text;

    var res = await httpService.request(ApiCode.UPDATE_USERINFO, params);
    if (res.data["code"] == 0) {
      _authService.updateUserDescription(params["description"]);
      showToast('修改成功');
      Navigator.pop(context);
    } else {
      showToast(res.data["msg"]);
    }
  }

  @override
  void initState() {
    super.initState();
    usernameController.text = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialogWrapper(
      title: '个人简介',
      width: ScreenUtil().setWidth(734),
      height: ScreenUtil().setHeight(592),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setHeight(52), vertical: ScreenUtil().setHeight(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputField(
              maxLength: 140,
              maxLines: 4,
              focusNode: _usernameFocus,
              autofocus: false,
              boxshape: Boxshape.round,
              hintText: "毕业学校、校荣誉等",
              keyboardType: TextInputType.multiline,
              controller: usernameController,
              borderColor: HexToColor("#CBAEFA"),
            ),
            Text(
              '请输入140个以内字符',
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
