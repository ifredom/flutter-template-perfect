import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'package:template/locator.dart';
import 'package:template/core/routes/routes.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:template/core/utils/common/color_helper.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/ui/pages/login/login_view_model.dart';
import 'package:template/ui/widgets/buttons/gradient_button.dart';
import 'package:template/ui/widgets/textfield/text_field.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  FocusNode _loginNameFocus = FocusNode();
  FocusNode _pwdFocus = FocusNode();
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
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Form(
            key: formKey,
            child: IgnorePointer(
              ignoring: model.isBusy,
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topCenter,
                fit: StackFit.loose,
                children: <Widget>[
                  Positioned(
                    top: 0,
                    child: Container(
                      width: ScreenUtil().screenWidth,
                      height: ScreenUtil().screenHeight,
                      child: Lottie.asset('assets/animations/lottie/18582-as-the-waters-rise.json'),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Center(
                        child: Container(
                          width: ScreenUtil().screenWidth * 0.68,
                          // height: ScreenUtil().screenHeight * 0.75,
                          padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(60),
                            vertical: ScreenUtil().setHeight(60),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              InputField(
                                focusNode: _loginNameFocus,
                                nextFocusNode: _pwdFocus,
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
                                focusNode: _pwdFocus,
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
                              Gaps.vGap40,
                              Center(
                                  child: Container(
                                height: ScreenUtil().setHeight(86.0),
                                decoration: BoxDecoration(
                                  //背景
                                  color: HexToColor('#A061FD'),
                                  //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                                  borderRadius: BorderRadius.all(Radius.circular(43.0)),
                                ),
                                child: GradientButton(
                                  text: '登录',
                                  colors: [HexToColor('#FF696A'), HexToColor('#FF894A')],
                                  onPressed: () {
                                    model.loginWithPassword(loginNameController.text, pwdController.text);
                                  },
                                ),
                              )),
                              Gaps.vGap30,
                              Center(
                                child: GestureDetector(
                                  child: Text(
                                    "手机验证码登录",
                                    style: TextStyle(
                                      color: HexToColor("#FF696A"),
                                      fontSize: ScreenUtil().setSp(30),
                                    ),
                                  ),
                                  onTap: () {
                                    locator<NavigationService>().push(ViewRoutes.loginPhoneView);
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
                ],
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
    Key key,
    @required this.formKey,
    @required this.phone,
    @required this.password,
  });

  @override
  Widget build(BuildContext context, LoginViewModel model) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2739,
      height: ScreenUtil().setHeight(86.0),
      decoration: BoxDecoration(
        //背景
        color: HexToColor('#A061FD'),
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: BorderRadius.all(Radius.circular(43.0)),
      ),
      child: TextButton(
        child: Text(
          '登录',
          style: TextStyle(fontSize: ScreenUtil().setSp(30), color: HexToColor('#ffffff')),
        ),
        onPressed: () {
          print("$phone  $password");
          if (!formKey.currentState.validate()) return;
          model.loginWithPassword(phone, password);
        },
      ),
    );
  }
}
