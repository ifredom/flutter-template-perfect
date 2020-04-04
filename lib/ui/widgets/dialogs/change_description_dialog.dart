import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:template/api/api.dart';
import 'package:template/api/http.dart';
import 'package:template/core/model/userinfo/user.dart';

import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/locator.dart';
import 'package:template/core/view_models/userinfo_view_model.dart';
import 'package:template/ui/widgets/buttons/gradient_button.dart';
import 'package:template/ui/widgets/textfield/text_field.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';

import './child/base_dialog_wrapper.dart';

class ChangeDescriptionDialog extends StatefulWidget {
  final UserinfoViewModel model;
  ChangeDescriptionDialog({Key key, this.model}) : super(key: key);
  @override
  _ChangeDescriptionDialogState createState() =>
      _ChangeDescriptionDialogState();
}

class _ChangeDescriptionDialogState extends State<ChangeDescriptionDialog> {
  final _authService = locator<AuthService>();
  FocusNode _usernameFocus = new FocusNode();
  TextEditingController usernameController = new TextEditingController();
  String _username = '';

  void _tappedCancel() async {
    print("取消");
    locator<NavigationService>().pop();
  }

  void _tappedSure() async {
    User userStore = _authService.currentUser;
    var params = Map<String, dynamic>();
    params["id"] = userStore.id;
    params["description"] = usernameController.text;

    var res = await httpUtil.request(ApiCode.UPDATE_USERINFO, params);
    if (res.data["code"] == 0) {
      widget.model.setDescription(params["description"]);
      showToast('修改成功');
      locator<NavigationService>().pop();
    } else {
      showToast(res.data["msg"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialogWrapper(
      title: '昵称',
      width: ScreenUtil().setSp(734),
      height: ScreenUtil().setSp(592),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(52),
            vertical: ScreenUtil().setSp(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            InputField(
              maxLength: 140,
              maxLines: 4,
              focusNode: _usernameFocus,
              autofocus: false,
              roundBox: false,
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
                horizontal: ScreenUtil().setSp(104),
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
