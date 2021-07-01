import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:template/core/app/locator.dart';
import 'package:template/core/routes/routes.dart';
import 'package:template/core/services/navigation/navigation_service.dart';

import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';
import 'package:template/ui/widgets/buttons/gradient_button.dart';
import 'package:template/ui/widgets/textfield/text_field.dart';

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
              width: ScreenUtil().screenWidth,
              height: ScreenUtil().screenHeight,
              decoration: BoxDecoration(
                color: HexToColor("#e9f1f6"),
              ),
              child: SingleChildScrollView(
                child: Container(
                  width: ScreenUtil().screenWidth * 0.638,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(60),
                        vertical: ScreenUtil().setHeight(60),
                      ),
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
                            height: ScreenUtil().setHeight(86.0),
                            decoration: BoxDecoration(
                              //背景
                              color: HexToColor('#A061FD'),
                              //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                              borderRadius: BorderRadius.all(Radius.circular(43.0)),
                            ),
                            child: GradientButton(
                              text: '登录',
                              width: ScreenUtil().setWidth(320.0),
                              height: ScreenUtil().setWidth(88.0),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(34.0),
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
                                  fontSize: ScreenUtil().setSp(30),
                                ),
                              ),
                              onTap: () {
                                locator<NavigationService>().push(ViewRoutes.loginView);
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
          if (!formKey.currentState!.validate()) return;
          model.loginWithPassword(phone, password);
        },
      ),
    );
  }
}
