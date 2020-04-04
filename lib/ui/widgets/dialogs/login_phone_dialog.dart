import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:template/ui/widgets/textfield/text_field.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/core/utils/res/resources.dart';

import './child/base_dialog_wrapper.dart';

class LoginPhoneDialog extends StatefulWidget {
  LoginPhoneDialog({Key key}) : super(key: key);
  @override
  _LoginPhoneDialogState createState() => _LoginPhoneDialogState();
}

class _LoginPhoneDialogState extends State<LoginPhoneDialog> {
  FocusNode _phoneFocus = FocusNode();
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
  }

  Future _tappedGetCode() async {
    showToast('发送成功');
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialogWrapper(
      height: ScreenUtil().setSp(837),
      title: '手机快捷登陆',
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(70),
            vertical: ScreenUtil().setSp(40)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
              hintText: "验证码",
              keyboardType: TextInputType.number,
              getVCode: () {
                String name = phoneController.text;
                if (name.isEmpty || name.length != 11) {
                  showToast('请填写正确的手机号');
                  return Future.value(false);
                } else {
                  _tappedGetCode();
                  return Future.value(true);
                }
              },
              onChanged: (String value) {
                _userPwd = value;
              },
            ),
            Gaps.vGap10,
            Text(
              '未注册享弹的手机号，登录时将自动注册。',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: HexToColor('#999999'),
                fontSize: ScreenUtil().setSp(24),
              ),
            ),
            Gaps.vGap70,
            buildLoginButton(),
            Gaps.vGap30,
            Center(
              child: Text(
                '-- 第三方登陆  --',
                textAlign: TextAlign.center,
              ),
            ),
            Gaps.vGap20,
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(340)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Image.asset(
                    "assets/images/index/pack1.png",
                    width: ScreenUtil().setSp(66),
                    height: ScreenUtil().setSp(66),
                  ),
                  Image.asset(
                    "assets/images/index/pack2.png",
                    width: ScreenUtil().setSp(66),
                    height: ScreenUtil().setSp(66),
                  ),
                ],
              ),
            )
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
