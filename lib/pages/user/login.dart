import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:chinaculture/api/api.dart';
import 'package:chinaculture/api/http.dart';
import 'package:chinaculture/routers/navigator_utils.dart';
import 'package:chinaculture/routers/routers.dart';
import 'package:chinaculture/store/index.dart';
import 'package:chinaculture/store/model/user.dart';
import 'package:chinaculture/utils/common/ScreenUtil.dart';
import 'package:chinaculture/utils/common/colorUtils.dart';
import 'package:chinaculture/utils/res/gaps.dart';
import 'package:chinaculture/widgets/textfield/text_field.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _phoneFocus = FocusNode();
  FocusNode _pwdFocus = FocusNode();
  final TextEditingController phoneController = new TextEditingController();
  final TextEditingController pwdController = new TextEditingController();
  String _userPhone = '';
  String _userPwd = '';

  void _tappedLogin() async {
    var params = Map<String, String>();
    params["mobile"] = _userPhone;
    params["pwd"] = _userPwd;

    var userStore = Store.value<UserModel>(context);
    print(userStore.isFetching);

    // 方式一：直接跳转
    NavigatorUtils.push(context, RoutesUtils.homePage);

    // 方式二，请求接口后跳转
    // var res = await http.request(Api.SIGN_IN, params);

    // if (res.data["code"] == 0) {
    //   UserInfo _userInfo = UserInfo.fromJson(res.data["data"]);
    //   Store.value<UserModel>(context).setInfo(_userInfo);
    //   NavigatorUtils.push(context, RoutesUtils.homePage);
    // } else {
    //   showToast(res.data["msg"]);
    // }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// 初始化屏幕适配.只能放在第一个页面
    /// init page response-visitor,must take the frist page
    ScreenUtil.instance =
        ScreenUtil(designDraftWidth: 1920, designDrafHeight: 1080)
          ..init(context);

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.638,
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.6783333),
            decoration: new BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color.fromRGBO(255, 215, 0, 0.4),
                width: 5,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildTitle(title: "Login"),
                Gaps.vGap40,
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setSp(70)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomTextField(
                          focusNode: _phoneFocus,
                          autofocus: false,
                          roundBox: true,
                          hintText: "input phone number",
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          borderColor: HexToColor("#CBAEFA"),
                          onChanged: (String value) {
                            _userPhone = value;
                          },
                        ),
                        Gaps.vGap20,
                        CustomTextField(
                          focusNode: _pwdFocus,
                          autofocus: false,
                          roundBox: true,
                          obscureText: true,
                          hintText: "input password",
                          controller: pwdController,
                          borderColor: HexToColor("#CBAEFA"),
                          onChanged: (String value) {
                            _userPwd = value;
                          },
                        ),
                        Gaps.vGap20,
                        Center(
                          child: buildLoginButton(),
                        ),
                        Gaps.vGap30,
                        Center(
                          child: GestureDetector(
                            child: Text(
                              "phone code login",
                              style: TextStyle(
                                color: HexToColor("#5324B3"),
                                fontSize: ScreenUtil().setSp(30),
                              ),
                            ),
                            onTap: () {
                              // NavigatorUtils.push(
                              //     context, UserRouter.loginPhonePage);
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
    );
  }

  Widget buildLoginButton() {
    return Container(
      width: 100,
      height: 32,
      decoration: new BoxDecoration(
        //背景
        color: HexToColor('#A061FD'),
        //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
        borderRadius: BorderRadius.all(Radius.circular(43.0)),
      ),
      child: new FlatButton(
        child: new Text(
          'Login',
          style: new TextStyle(fontSize: 15, color: HexToColor('#ffffff')),
        ),
        onPressed: _tappedLogin,
      ),
    );
  }

  Widget _buildTitle({String title}) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: ScreenUtil().setHeight(20),
          horizontal: ScreenUtil().setWidth(50)),
      decoration: new BoxDecoration(
        color: HexToColor('#7B68EE'),
        border: Border.all(color: Colors.transparent, width: 0.5), // 边色与边宽度
        borderRadius: BorderRadius.vertical(top: Radius.elliptical(16, 16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Gaps.empty,
          Text(
            title,
            style: TextStyle(
                color: HexToColor('#5324B3'), fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
