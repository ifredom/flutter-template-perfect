import 'package:fluttertemplate/core/app/locator.dart';
import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'package:fluttertemplate/core/utils/common/color_utils.dart';
import 'package:fluttertemplate/core/utils/res/gaps.dart';
import 'package:fluttertemplate/ui/views/login/login_view_model.dart';
import 'package:fluttertemplate/ui/widgets/buttons/gradient_button.dart';
import 'package:fluttertemplate/ui/widgets/textfield/text_field.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  final FocusNode loginNameFocus = FocusNode();
  final FocusNode pwdFocus = FocusNode();
  final TextEditingController loginNameController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();

  @override
  void initState() {
    super.initState();

    loginNameController.text = "ifredom"; // 设置默认值
    pwdController.text = "123456"; // 设置默认值
    loginNameController.addListener(() {
      // 做点什么
    });
    pwdController.addListener(() {
      // 做点什么
    });
  }

  @override
  void dispose() {
    loginNameController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
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
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 60,
                            vertical: 50,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InputField(
                                focusNode: loginNameFocus,
                                nextFocusNode: pwdFocus,
                                roundBox: true,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                                hintText: "请输入账号",
                                hintStyle: TextStyle(color: HexToColor("#FFFFFF")),
                                controller: loginNameController,
                                borderColor: HexToColor("#CBAEFA"),
                              ),
                              Gaps.vGap40,
                              InputField(
                                focusNode: pwdFocus,
                                roundBox: true,
                                obscureText: true,
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                                hintText: "请输入登陆密码",
                                hintStyle: TextStyle(color: HexToColor("#FFFFFF")),
                                controller: pwdController,
                                borderColor: HexToColor("#CBAEFA"),
                              ),
                              Gaps.vGap20,
                              Center(
                                  child: GradientButton(
                                text: '登录',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                                colors: [HexToColor('#FF696A'), HexToColor('#FF894A')],
                                onPressed: () async {
                                  await model.loginWithPassword(loginNameController.text, pwdController.text);
                                },
                              )),
                              Gaps.vGap20,
                              Center(
                                child: GestureDetector(
                                  child: FittedBox(
                                    child: Text(
                                      "手机验证码登录",
                                      style: TextStyle(
                                        color: HexToColor("#FF696A"),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    locator<NavigationService>().navigateTo(Routes.loginPhoneView);
                                  },
                                ),
                              ),
                              Gaps.vGap40,
                            ],
                          ),
                        ),
                      ),
                      Lottie.asset('assets/animations/lottie/18582-as-the-waters-rise.json'),
                    ],
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

class BuildLoginButton extends ViewModelWidget<LoginViewModel> {
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
  bool get reactive => false;

  @override
  Widget build(BuildContext context, LoginViewModel model) {
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
