import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:template/api/api.dart';
import 'package:template/api/http.dart';
import 'package:template/core/enums/user_state.dart';
import 'package:template/core/model/userinfo/user.dart';

import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/services/navigation/navigation_service.dart';
import 'package:template/locator.dart';
import 'package:template/core/view_models/userinfo_view_model.dart';
import 'package:template/ui/widgets/buttons/gradient_button.dart';
import 'package:template/core/utils/common/ScreenUtil.dart';
import 'package:template/core/utils/common/color_utils.dart';
import 'package:template/core/utils/res/gaps.dart';

import './child/base_dialog_wrapper.dart';

class ChangeSexDialog extends StatefulWidget {
  final UserinfoViewModel model;
  ChangeSexDialog({this.model});
  @override
  _ChangeSexDialogState createState() => _ChangeSexDialogState();
}

class _ChangeSexDialogState extends State<ChangeSexDialog> {
  final _authService = locator<AuthService>();
  SexEnum _avtive = SexEnum.man;

  void _tappedCancel() async {
    print("点击取消");
    locator<NavigationService>().pop();
  }

  void _tappedSure() async {
    User userStore = _authService.currentUser;

    var params = Map<String, dynamic>();
    params["id"] = userStore.id;
    params["gender"] = (_avtive == SexEnum.man) ? 1 : 2;

    var res = await httpUtil.request(ApiCode.UPDATE_USERINFO, params);
    print("返回得结果");
    print(res.data);

    if (res.data["code"] == 0) {
      widget.model.setSex(params["gender"]);
      showToast('修改成功');
      locator<NavigationService>().pop();
    } else {
      showToast(res.data["msg"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialogWrapper(
      title: '性别',
      width: ScreenUtil().setSp(734),
      height: ScreenUtil().setSp(592),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setSp(146),
            vertical: ScreenUtil().setSp(40)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  child: _avtive == SexEnum.man
                      ? _wrapperAdvatorImg("assets/images/custom/man.png", true)
                      : _wrapperAdvatorImg(
                          "assets/images/custom/man.png", false),
                  onTap: () {
                    if (_avtive != SexEnum.man) {
                      setState(() {
                        _avtive = SexEnum.man;
                      });
                    }
                  },
                ),
                // SizedBox(width: ScreenUtil().setWidth(138)),
                GestureDetector(
                  child: _avtive == SexEnum.women
                      ? _wrapperAdvatorImg(
                          "assets/images/custom/women.png", true)
                      : _wrapperAdvatorImg(
                          "assets/images/custom/women.png", false),
                  onTap: () {
                    if (_avtive != SexEnum.women) {
                      setState(() {
                        _avtive = SexEnum.women;
                      });
                    }
                  },
                ),
              ],
            ),
            Gaps.vGap100,
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GradientButton(
                  colors: [HexToColor('#C7B8E6')],
                  text: "取消",
                  onPressed: () {
                    _tappedCancel();
                  },
                ),
                GradientButton(
                  text: '确定',
                  colors: [HexToColor('#FF696A'), HexToColor('#FF894A')],
                  onPressed: () {
                    _tappedSure();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _wrapperAdvatorImg(String assetUrl, bool avtiveMan) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: avtiveMan ? HexToColor('#8A5AC6') : HexToColor('#FFFFFF'),
          width: 2,
        ), // #0D4DED
      ),
      child: Image.asset(
        assetUrl,
        width: ScreenUtil().setWidth(160),
      ),
    );
  }
}
