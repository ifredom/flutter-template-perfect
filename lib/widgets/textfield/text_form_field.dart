import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../utils/res/gaps.dart';
import '../../utils/res/styles.dart';
import '../../utils/common/ScreenUtil.dart';
import '../../utils/common/colorUtils.dart';

class CustomFormTextField extends StatefulWidget {
  const CustomFormTextField({
    Key key,
    this.hintText: "",
    this.prefixIcon,
    this.suffixIcon,
    this.getVCode,
    this.autofocus = false,
    this.roundBox = true, // 圆角边框风格 | 一条底线风格
    this.controller,
    this.onChanged,
    this.focusNode,
    this.keyboardType: TextInputType.text,
  }) : super(key: key);

  final String hintText;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool autofocus;
  final bool roundBox;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final Future<bool> Function() getVCode;

  @override
  _CustomFormTextFieldState createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  /// 倒计时秒数
  bool _isClick = true;
  final int second = 120;

  /// 当前秒数
  int s;
  StreamSubscription _subscription;

  Future _getVCode() async {
    bool isSuccess = await widget.getVCode();
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
    _subscription?.cancel();
    super.dispose();
  }

  Widget createFormTextField() {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
      keyboardType: widget.keyboardType,
      // 在改变属性，当正在编辑的文本发生更改时调用。每次修改字段文本时都会调用一次。
      onChanged: widget.onChanged,
      // 数字、手机号限制格式为0到9(白名单)， 密码限制不包含汉字（黑名单）
      inputFormatters: (widget.keyboardType == TextInputType.number ||
              widget.keyboardType == TextInputType.phone)
          ? [WhitelistingTextInputFormatter(RegExp("[0-9]"))]
          : [BlacklistingTextInputFormatter(RegExp("[\u4e00-\u9fa5]"))],
      decoration: InputDecoration(
        // labelText: "用户名",
        contentPadding: EdgeInsets.symmetric(vertical: ScreenUtil().setSp(16)),
        counterText: "",
        hintText: widget.hintText,
        border: InputBorder.none,
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(16.0))),
        hintStyle: TextStyles.textGrayC14,
        labelStyle: TextStyle(fontSize: ScreenUtil().setSp(30)),
        prefixStyle: TextStyle(
          color: Colors.black54,
          fontSize: ScreenUtil().setSp(30),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _decoration = widget.roundBox
        ? BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color.fromRGBO(217, 217, 217, 1),
            ),
            borderRadius: const BorderRadius.all(const Radius.circular(32)),
          )
        : UnderlineTabIndicator(
            borderSide: BorderSide(width: 1.0, color: Color(0xFFeeeeee)),
          );

    return Container(
      height: ScreenUtil().setHeight(86.0),
      padding: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(32), 0, ScreenUtil().setWidth(32), 0),
      decoration: _decoration,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          widget.prefixIcon == null ? Gaps.empty : widget.prefixIcon,
          // SizedBox(width: ScreenUtil().setWidth(32)),
          Expanded(
            flex: 80,
            child: createFormTextField(),
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
                    SizedBox(width: ScreenUtil().setWidth(6)),
                    FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 0),
                      child: Text(
                        _isClick ? "获取验证码" : "$s秒后重发",
                        style: TextStyle(color: HexToColor('#A061FD')),
                      ),
                      onPressed: _isClick ? _getVCode : null,
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
