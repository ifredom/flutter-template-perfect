import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

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
      onModelReady: (model) => model.onModelReady(),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
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
            child: Form(
              key: formKey,
              child: IgnorePointer(
                ignoring: model.isBusy,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                    BuildLoginButton(
                      loginNameController: loginNameController,
                      pwdController: pwdController,
                    ),
                  ],
                ),
              ),
              // Lottie.asset('assets/animations/lottie/18582-as-the-waters-rise.json', fit: BoxFit.fitWidth),
            ),
          ),
        ),
      ),
    );
  }
}

class BuildLoginButton extends ViewModelWidget<LoginViewModel> {
  final TextEditingController loginNameController;
  final TextEditingController pwdController;

  BuildLoginButton({
    Key? key,
    required this.loginNameController,
    required this.pwdController,
  });

  @override
  bool get reactive => false;

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Center(
        child: GradientButton(
      text: 'Sign In',
      style: TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      colors: [HexToColor('#FF696A'), HexToColor('#FF894A')],
      onPressed: () async {
        await model.loginWithPassword(loginNameController.text, pwdController.text);
      },
    ));
  }
}
