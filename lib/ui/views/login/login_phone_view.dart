import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fluttertemplate/core/app/app.locator.dart';

import 'package:fluttertemplate/core/utils/common/color_utils.dart';
import 'package:fluttertemplate/core/utils/res/gaps.dart';
import 'package:fluttertemplate/ui/widgets/buttons/gradient_button.dart';
import 'package:fluttertemplate/ui/widgets/textfield/text_field.dart';

import 'login_phone_view_model.dart';

class LoginPhoneView extends StatefulWidget {
  @override
  _LoginPhoneViewState createState() => _LoginPhoneViewState();
}

class _LoginPhoneViewState extends State<LoginPhoneView> {
  final formKey = GlobalKey<FormState>();
  FocusNode _loginFocus = FocusNode();
  FocusNode _pwdFocus = FocusNode();
  final TextEditingController loginPhoneController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();

    loginPhoneController.addListener(() {
      // 做点什么
    });
    pwdController.addListener(() {
      // 做点什么
    });
  }

  @override
  void dispose() {
    loginPhoneController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginPhoneViewModel>.nonReactive(
      viewModelBuilder: () => LoginPhoneViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Form(
          key: formKey,
          child: IgnorePointer(
            ignoring: model.isBusy,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: HexToColor("#e9f1f6"),
              ),
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          InputField(
                            focusNode: _loginFocus,
                            nextFocusNode: _pwdFocus,
                            hintText: "请输入手机号",
                            keyboardType: TextInputType.phone,
                            controller: loginPhoneController,
                          ),
                          Gaps.vGap40,
                          InputField(
                            focusNode: _pwdFocus,
                            hintText: "请输入登陆密码",
                            controller: pwdController,
                          ),
                          Gaps.vGap40,
                          Center(
                              child: Container(
                            width: MediaQuery.of(context).size.width * 0.2739,
                            height: 44,
                            decoration: BoxDecoration(
                              //背景
                              color: HexToColor('#A061FD'),
                              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                              borderRadius: BorderRadius.all(Radius.circular(43.0)),
                            ),
                            child: GradientButton(
                              text: '登录',
                              width: 160,
                              height: 44,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              colors: [HexToColor('#FF696A'), HexToColor('#FF894A')],
                              onPressed: () {
                                if (!formKey.currentState!.validate()) return;
                                model.loginWithPassword(loginPhoneController.text, pwdController.text);
                              },
                            ),
                          )),
                          Gaps.vGap30,
                          Center(
                            child: GestureDetector(
                              child: Text(
                                "手机号登陆",
                                style: TextStyle(
                                  color: HexToColor("#FF696A"),
                                  fontSize: 15,
                                ),
                              ),
                              onTap: () {
                                locator<NavigationService>().navigateTo(Routes.loginView);
                              },
                            ),
                          ),
                          Gaps.vGap40,
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
}

class BuildLoginButton extends ViewModelWidget<LoginPhoneViewModel> {
  final GlobalKey<FormState> formKey;
  final String phone;
  final String password;

  BuildLoginButton({
    Key? key,
    required this.formKey,
    required this.phone,
    required this.password,
  });

  @override
  Widget build(BuildContext context, LoginPhoneViewModel model) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2739,
      height: 43,
      decoration: BoxDecoration(
        //背景
        color: HexToColor('#A061FD'),
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: BorderRadius.all(Radius.circular(43.0)),
      ),
      child: TextButton(
        child: Text(
          '登录',
          style: TextStyle(fontSize: 15, color: HexToColor('#ffffff')),
        ),
        onPressed: () {
          print("$phone  $password");
          if (!formKey.currentState!.validate()) return;
          model.loginWithPassword(phone, password);
        },
      ),
    );
  }
}
