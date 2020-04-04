import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'package:template/core/routes/routers.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/locator.dart';
import 'package:template/ui/widgets/textfield/text_field.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';

import './child/base_dialog_wrapper.dart';

class LoginDialog extends StatefulWidget {
  LoginDialog({Key key}) : super(key: key);
  @override
  _LoginDialogState createState() => _LoginDialogState();
}

class _LoginDialogState extends State<LoginDialog> {
  FocusNode _phoneFocus = FocusNode();
  FocusNode _pwdFocus = FocusNode();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController pwdController = new TextEditingController();
  String _userPhone;
  String _userPwd;

  void _tappedLogin() async {
    var params = Map<String, String>();
    params["phone"] = _userPhone;
    params["password"] = _userPwd;
    print(_userPhone);

    showToast('请检查密码');

    locator<NavigationService>().push(RoutesUtils.homePage);
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialogWrapper(
      title: '账号密码登陆',
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(70),
            vertical: ScreenUtil().setSp(40)),
        child: Column(
          children: <Widget>[
            InputField(
              focusNode: _phoneFocus,
              autofocus: true,
              hintText: "请输入手机号",
              keyboardType: TextInputType.phone,
              controller: phoneController,
              onChanged: (String value) {
                _userPhone = value;
              },
            ),
            Gaps.vGap40,
            InputField(
              focusNode: _pwdFocus,
              autofocus: true,
              hintText: "请输入手机号",
              keyboardType: TextInputType.phone,
              controller: pwdController,
              onChanged: (String value) {
                _userPwd = value;
              },
            ),
            Gaps.vGap120,
            buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget buildLoginButton() {
    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(86.0),
      decoration: new BoxDecoration(
        //背景
        color: HexToColor('#A061FD'),
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: BorderRadius.all(Radius.circular(43.0)),
      ),
      child: new FlatButton(
        child: new Text(
          '登录',
          style: new TextStyle(
              fontSize: ScreenUtil().setSp(30), color: HexToColor('#ffffff')),
        ),
        onPressed: _tappedLogin,
      ),
    );
  }
}
