import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/res/gaps.dart';
import '../../utils/common/ScreenUtil.dart';
import '../../utils/common/colorUtils.dart';

// 使用原textfield的属性，进行扩展
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key key,
    this.hintText: "",
    this.hintStyle,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.getVCode,
    this.autofocus = false,
    this.obscureText = false,
    this.roundBox = true, // 圆角边框风格 | 一条底线风格
    this.controller,
    this.onChanged,
    this.focusNode,
    this.validator,
    this.keyboardType: TextInputType.text,
  }) : super(key: key);

  final String hintText;
  final TextStyle hintStyle;
  final Color borderColor;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool autofocus;
  final bool roundBox;
  final bool obscureText;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final Future<bool> Function() validator;
  final Future<bool> Function() getVCode;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  /// 倒计时秒数
  bool _isClick = true;
  final int second = 20;

  /// 当前秒数
  int s;
  StreamSubscription _subscription;

  Future _getVCode() async {
    bool isSuccess = await widget.getVCode();

    print(_subscription);
    if (isSuccess != null && isSuccess) {
      setState(() {
        s = second;
        _isClick = false;
      });
      _subscription = Stream.periodic(Duration(seconds: 1), (i) => i)
          .take(second)
          .listen((i) {
        setState(() {
          s = second - i - 1;
          _isClick = s < 1;
        });
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _subscription.cancel();
  }

  Widget _createTextField() {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      // 是否隐藏输入得内容，用于输入密码时
      obscureText: widget.obscureText,
      // 在改变属性，当正在编辑的文本发生更改时调用。每次修改字段文本时都会调用一次。
      onChanged: widget.onChanged,
      // 数字、手机号限制格式为0到9(白名单)， 密码限制不包含汉字（黑名单）
      inputFormatters: (widget.keyboardType == TextInputType.number ||
              widget.keyboardType == TextInputType.phone)
          ? [WhitelistingTextInputFormatter(RegExp("[0-9]"))]
          : [BlacklistingTextInputFormatter(RegExp("[\u4e00-\u9fa5]"))],
      style: TextStyle(
        color: Colors.black,
        fontSize: 15.0,
      ),
      decoration: InputDecoration(
        isDense: true,
        // labelText: "用户名",
        // contentPadding: EdgeInsets.only(
        //   top: ScreenUtil().setSp(5),
        //   bottom: ScreenUtil().setSp(5),
        // ),
        border: InputBorder.none,
        fillColor: HexToColor("#482C70"),
        // 如果filled=true，则背景为fillColor，无需包在Container控件中
        // filled: false,
        // errorText: 'error',
        //计算数字
        counterText: "",
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ?? null,
        // 必须是Icon
        prefixIcon: widget.prefixIcon ?? null,
        prefixStyle: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          height: ScreenUtil().setSp(30),
        ),
        suffixIcon: widget.suffixIcon ?? null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return _createTextField();
    return _buildTextfieldWrapper(child: _createTextField());
  }

  Widget _buildTextfieldWrapper({Widget child}) {
    Decoration _decoration = widget.roundBox
        ? BoxDecoration(
            border: Border.all(
              width: 1,
              color: widget.borderColor ?? Color.fromRGBO(217, 217, 217, 1),
            ),
            borderRadius: const BorderRadius.all(const Radius.circular(32)),
          )
        : UnderlineTabIndicator(
            borderSide: BorderSide(width: 1.0, color: Color(0xFFeeeeee)),
          );

    return Container(
      // height: ScreenUtil().setHeight(86.0),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(32), 0, ScreenUtil().setWidth(32), 0),
      decoration: _decoration,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          widget.prefixIcon == null ? Gaps.empty : widget.prefixIcon,
          Expanded(
            flex: 80,
            child: child,
          ),
          widget.suffixIcon == null ? Gaps.empty : widget.suffixIcon,
          widget.getVCode == null
              ? Gaps.empty
              : Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(width: ScreenUtil().setWidth(32)),
                    SizedBox(
                      width: 1,
                      height: ScreenUtil().setSp(48),
                      child: Container(
                        color: HexToColor('#767680'),
                      ),
                    ),
                    SizedBox(width: ScreenUtil().setWidth(32)),
                    GestureDetector(
                      // padding: EdgeInsets.symmetric(vertical: 0),
                      child: Text(
                        _isClick ? "获取验证码" : "$s秒后重发",
                        style: TextStyle(color: HexToColor('#A061FD')),
                      ),
                      onTap: _isClick ? _getVCode : null,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
