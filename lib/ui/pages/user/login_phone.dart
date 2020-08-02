import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:oktoast/oktoast.dart';
import 'package:stacked/stacked.dart';
import 'package:template/api/apicode/api.dart';
import 'package:template/api/http_service_impl.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/ui/pages/user/login_view_model.dart';

import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/ui/widgets/textfield/text_field.dart';

import '../../routers.dart';

class LoginPhonePage extends StatefulWidget {
  @override
  _LoginPhonePageState createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {
  final _authService = locator<AuthService>();
  final formKey = GlobalKey<FormState>();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _vCodeFocus = FocusNode();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController vcodeController = TextEditingController();

  @override
  void initState() {
    super.initState();

    phoneController.text = "15833244331"; // 测试，设置默认值
    phoneController.addListener(() {
      // 做点什么
    });
    vcodeController.text = "1234"; // 测试，设置默认值
  }

  @override
  void dispose() {
    phoneController.dispose();
    vcodeController.dispose();
    super.dispose();
  }

  Future _tappedGetCode() async {
    var params = Map<String, String>();
    params["phone"] = phoneController.text;
    var res = await httpService.request(ApiCode.GET_CODE, params);

    if (res.data["code"] == 0) {
      showToast('发送成功');
    } else {
      showToast(res.data["msg"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () =>LoginViewModel(),
      builder: (context, model, child) => PlatformScaffold(
        body: Form(
          key: formKey,
          child: IgnorePointer(
            ignoring: model.isbusy,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/bg/login@2x.png",
                  ),
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.638,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.8,
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _buildTitle(title: "登录"),
                          Gaps.vGap40,
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(70)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InputField(
                                  focusNode: _phoneFocus,
                                  nextFocusNode: _vCodeFocus,
                                  autofocus: false,
                                  roundBox: true,
                                  hintText: "请输入手机号",
                                  keyboardType: TextInputType.phone,
                                  controller: phoneController,
                                  borderColor: HexToColor("#CBAEFA"),
                                  validator: (_) => model.validatePhoneNumber(phoneController.text),
                                ),
                                Gaps.vGap40,
                                InputField(
                                  hintText: "验证码",
                                  focusNode: _vCodeFocus,
                                  keyboardType: TextInputType.number,
                                  controller: vcodeController,
                                  borderColor: HexToColor("#CBAEFA"),
                                  getVCode: () {
                                    String val = phoneController.text;
                                    if (val.isEmpty || val.length != 11) {
                                      showToast('请填写正确的手机号');
                                      return Future.value(false);
                                    } else {
                                      _tappedGetCode();
                                      return Future.value(true);
                                    }
                                  },
                                ),
                                Gaps.vGap10,
                                Text(
                                  '未注的手机号，登录时将自动注册。',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: HexToColor('#999999'),
                                    fontSize: ScreenUtil().setSp(24),
                                  ),
                                ),
                                Gaps.vGap40,
                                Center(
                                  child: buildLoginButton(model),
                                ),
                                Gaps.vGap40,
                                Center(
                                  child: GestureDetector(
                                    child: Text(
                                      "手机登录",
                                      style: TextStyle(
                                        color: HexToColor("#5324B3"),
                                        fontSize: ScreenUtil().setSp(30),
                                      ),
                                    ),
                                    onTap: () {
                                      locator<NavigationService>().push(RoutesUtils.loginPage);
                                    },
                                  ),
                                ),
                                Gaps.vGap20,
                                Center(
                                  child: Text(
                                    '-- 第三方登陆  --',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: HexToColor("#999999"),
                                      fontSize: ScreenUtil().setSp(24),
                                    ),
                                  ),
                                ),
                                Gaps.vGap30,
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setSp(340)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/images/custom/wechat.png",
                                        width: ScreenUtil().setSp(66),
                                        height: ScreenUtil().setSp(66),
                                      ),
                                      Image.asset(
                                        "assets/images/custom/qq.png",
                                        width: ScreenUtil().setSp(66),
                                        height: ScreenUtil().setSp(66),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginButton(LoginViewModel model) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2739,
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
          style: new TextStyle(fontSize: ScreenUtil().setSp(30), color: HexToColor('#ffffff')),
        ),
        // onPressed: _tappedLogin,
        onPressed: () {
          if (!formKey.currentState.validate()) return;

          model.loginWithVcode(
            phoneController.text,
            vcodeController.text,
          );
        },
      ),
    );
  }

  Widget _buildTitle({String title}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20), horizontal: ScreenUtil().setWidth(50)),
      decoration: new BoxDecoration(
        color: HexToColor('#F7F2FF'),
        border: Border.all(color: Colors.transparent, width: 0.5), // 边色与边宽度
        borderRadius: BorderRadius.vertical(top: Radius.elliptical(16, 16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Gaps.empty,
          Text(
            title,
            style: TextStyle(color: HexToColor('#5324B3'), fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            child: Image.asset(
              'assets/images/custom/close@2x.png',
              fit: BoxFit.fitWidth,
              width: ScreenUtil().setHeight(34),
              height: ScreenUtil().setHeight(34),
            ),
            onTap: () {
              locator<NavigationService>().pop();
            },
          )
        ],
      ),
    );
  }
}
