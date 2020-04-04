import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';

// 使用原textfield的属性，进行扩展
// 参考项目 auctionesia_pengguna-master，可以优化
class InputField extends StatefulWidget {
  final bool isReadOnly;
  final int maxLength;
  final int maxLines;
  final String hintText;
  final TextStyle hintStyle;
  final EdgeInsetsGeometry padding;
  final Color borderColor;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final bool autofocus;
  final bool roundBox;
  final int roundBoxRadius;
  final bool obscureText;
  final TextEditingController controller;
  final Function validator;
  final ValueChanged<String> onChanged;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextInputType keyboardType;
  final Function onFieldSubmitted;
  final TextInputFormatter formatter;
  final Future<bool> Function() getVCode;

  const InputField({
    Key key,
    this.isReadOnly = false,
    this.maxLength,
    this.maxLines,
    this.hintText: "",
    this.hintStyle,
    this.padding,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.getVCode,
    this.autofocus = false,
    this.obscureText = false,
    this.roundBox = true, // 圆角边框风格 | 一条底线风格
    this.roundBoxRadius, // 圆角边框风格 | 一条底线风格
    this.controller,
    this.validator,
    this.onChanged,
    this.focusNode,
    this.nextFocusNode,
    this.formatter,
    this.onFieldSubmitted,
    this.keyboardType: TextInputType.text,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<InputField> {
  /// 倒计时秒数
  bool _isClick = true;
  final int second = 20;

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

  fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget _createTextField() {
    return TextFormField(
      readOnly: widget.isReadOnly,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines ?? 1,
      controller: widget.controller,
      validator: widget.validator,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.nextFocusNode != null
          ? (_) => fieldFocusChange(
                context,
                widget.focusNode,
                widget.nextFocusNode,
              )
          : (_) => widget.focusNode.unfocus(),
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
        textBaseline: TextBaseline.alphabetic,
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
        // prefixIcon: widget.prefixIcon ?? null,
        // prefixStyle: TextStyle(
        //   fontSize: ScreenUtil().setSp(30),
        //   height: ScreenUtil().setSp(30),
        // ),
        // suffixIcon: widget.suffixIcon ?? null,
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
            borderRadius: widget.roundBoxRadius == 0
                ? BorderRadius.zero
                : BorderRadius.all(
                    Radius.circular(widget.roundBoxRadius ?? 32)),
          )
        : UnderlineTabIndicator(
            borderSide: BorderSide(width: 1.0, color: Color(0xFFeeeeee)),
          );

    EdgeInsetsGeometry _padding = widget.padding ??
        EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(32), 0, ScreenUtil().setWidth(32), 0);

    return Container(
      padding: _padding,
      decoration: _decoration,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          null == widget.prefixIcon ? Gaps.empty : widget.prefixIcon,
          null == widget.prefixIcon ? Gaps.empty : Gaps.hGap10,
          Expanded(
            flex: 80,
            child: child,
          ),
          null == widget.suffixIcon ? Gaps.empty : widget.suffixIcon,
          null == widget.suffixIcon ? Gaps.empty : Gaps.hGap10,
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
