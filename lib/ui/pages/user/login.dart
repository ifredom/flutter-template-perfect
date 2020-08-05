import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:template/core/routes/routers.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/ui/pages/user/login_view_model.dart';
import 'package:template/locator.dart';

import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/ui/widgets/textfield/text_field.dart';
import 'package:provider_architecture/provider_widget.dart';
import 'package:provider_architecture/viewmodel_provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  FocusNode _phoneFocus = FocusNode();
  FocusNode _pwdFocus = FocusNode();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController pwdController = new TextEditingController();

  @override
  void initState() {
    super.initState();

    // phoneController.text = "1351613765"; // 测试，设置默认值
    // pwdController.text = "123456"; // 测试，设置默认值
    phoneController.addListener(() {
      // 做点什么
    });
    pwdController.addListener(() {
      // 做点什么
    });
  }

  @override
  void dispose() {
    phoneController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withoutConsumer(
      viewModel: LoginViewModel(),
      builder: (context, model, child) => PlatformScaffold(
        body: Form(
          key: formKey,
          child: IgnorePointer(
            ignoring: model.isBusy,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/images/loginbg.png",
                  ),
                ),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.638,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color.fromRGBO(0, 0, 0, 0.2),
                        width: 5,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        _buildTitle(title: "登录"),
                        Gaps.vGap40,
                        SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setSp(70)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                InputField(
                                  focusNode: _phoneFocus,
                                  nextFocusNode: _pwdFocus,
                                  roundBox: true,
                                  hintText: "请输入手机号",
                                  keyboardType: TextInputType.phone,
                                  controller: phoneController,
                                  borderColor: HexToColor("#CBAEFA"),
                                  validator: (_) => model.validatePhoneNumber(
                                      phoneController.text),
                                ),
                                Gaps.vGap40,
                                InputField(
                                  focusNode: _pwdFocus,
                                  roundBox: true,
                                  obscureText: true,
                                  hintText: "请输入密码",
                                  controller: pwdController,
                                  borderColor: HexToColor("#CBAEFA"),
                                ),
                                Gaps.vGap10,
                                Text(
                                  "未注册享弹的手机号，登陆时将自动注册",
                                  style:
                                      TextStyle(color: HexToColor("#999999")),
                                ),
                                Gaps.vGap60,
                                Center(
                                    child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.2739,
                                  height: ScreenUtil().setHeight(86.0),
                                  decoration: new BoxDecoration(
                                    //背景
                                    color: HexToColor('#A061FD'),
                                    //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(43.0)),
                                  ),
                                  child: new FlatButton(
                                    child: new Text(
                                      '登录',
                                      style: new TextStyle(
                                          fontSize: ScreenUtil().setSp(30),
                                          color: HexToColor('#ffffff')),
                                    ),
                                    onPressed: () async {
                                      if (!formKey.currentState.validate())
                                        return;
                                      model.loginWithPassword(
                                          phoneController.text,
                                          pwdController.text);
                                    },
                                  ),
                                )),
                                Gaps.vGap30,
                                Center(
                                  child: GestureDetector(
                                    child: Text(
                                      "手机验证码登录",
                                      style: TextStyle(
                                        color: HexToColor("#5324B3"),
                                        fontSize: ScreenUtil().setSp(30),
                                      ),
                                    ),
                                    onTap: () {
                                      locator<NavigationService>()
                                          .push(ViewRoutes.loginPhonePage);
                                    },
                                  ),
                                ),
                                Gaps.vGap40,
                              ],
                            ),
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
    );
  }

  Widget _buildTitle({String title}) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(20),
          horizontal: ScreenUtil().setWidth(50)),
      decoration: new BoxDecoration(
        color: HexToColor('#F7F2FF'),
        border: Border.all(color: Colors.transparent, width: 0.5), // 边色与边宽度
        borderRadius: BorderRadius.vertical(top: Radius.elliptical(16, 16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Gaps.empty,
          Text(
            title,
            style: TextStyle(
                color: HexToColor('#5324B3'), fontWeight: FontWeight.bold),
          ),
          // GestureDetector(
          //   child: Image.asset(
          //     'assets/images/custom/close@2x.png',
          //     fit: BoxFit.fitWidth,
          //     width: ScreenUtil().setHeight(34),
          //     height: ScreenUtil().setHeight(34),
          //   ),
          //   onTap: () {
          //     locator<NavigationService>().pop();
          //   },
          // )
        ],
      ),
    );
  }
}

class BuildLoginButton extends ProviderWidget<LoginViewModel> {
  final GlobalKey<FormState> formKey;
  final String phone;
  final String password;

  BuildLoginButton({
    Key key,
    @required this.formKey,
    @required this.phone,
    @required this.password,
  }) : super(key: key, listen: false);

  @override
  Widget build(BuildContext context, LoginViewModel model) {
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
          style: new TextStyle(
              fontSize: ScreenUtil().setSp(30), color: HexToColor('#ffffff')),
        ),
        onPressed: () async {
          print("$phone  $password");
          if (!formKey.currentState.validate()) return;
          model.loginWithPassword(phone, password);
        },
      ),
    );
  }
}
