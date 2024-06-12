import 'package:flutter/material.dart';
import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/core/app/app.router.dart';
import 'package:fluttertemplate/core/utils/common/color_utils.dart';
import 'package:fluttertemplate/core/utils/res/gaps.dart';
import 'package:fluttertemplate/ui/views/login/login_view_model.dart';
import 'package:fluttertemplate/ui/widgets/buttons/gradient_button.dart';
import 'package:fluttertemplate/ui/widgets/textfield/text_field.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  LoginViewState createState() => LoginViewState();
}

class LoginViewState extends State<LoginView> {
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
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/loginbg.png",
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
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
                      textStyle: const TextStyle(
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
                      textStyle: const TextStyle(
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
                    LoginButton(loginNameController: loginNameController, pwdController: pwdController),
                    Gaps.vGap20,
                    const Center(child: PhoneCodeButton()),
                    Gaps.vGap40,
                    Consumer(builder: (_, a, build) {
                      return const Center(child: ThirdButton());
                    }),
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

class LoginButton extends ViewModelWidget<LoginViewModel> {
  const LoginButton({
    super.key,
    required this.loginNameController,
    required this.pwdController,
  }) : super(reactive: false);

  final TextEditingController loginNameController;
  final TextEditingController pwdController;

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    print("LoginButton build");
    return Center(
        child: GradientButton(
      text: '登录 ${viewModel.testString}',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      colors: [HexToColor('#FF696A'), HexToColor('#FF894A')],
      onPressed: () async {
        await viewModel.loginWithPassword(loginNameController.text, pwdController.text);
      },
    ));
  }
}

class PhoneCodeButton extends ViewModelWidget<LoginViewModel> {
  const PhoneCodeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    print("PhoneCodeButton build");
    return GestureDetector(
      child: FittedBox(
        child: Text(
          "手机验证码登录 ${viewModel.isBusy.toString()}",
          style: TextStyle(
            color: HexToColor("#FF696A"),
            fontSize: 15,
          ),
        ),
      ),
      onTap: () {
        locator<NavigationService>().navigateTo(Routes.loginPhoneView);
      },
    );
  }
}

class ThirdButton extends ViewModelWidget<LoginViewModel> {
  const ThirdButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, LoginViewModel viewModel) {
    print("ThirdButton build");
    return GestureDetector(
      child: FittedBox(
        child: Text(
          "ThirdButton ${viewModel.isBusy.toString()}",
          style: TextStyle(
            color: HexToColor("#FF696A"),
            fontSize: 15,
          ),
        ),
      ),
      onTap: () {
        locator<NavigationService>().navigateTo(Routes.loginPhoneView);
      },
    );
  }
}
