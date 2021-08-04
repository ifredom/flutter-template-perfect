import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pianostudent/core/enums/business_status.dart';
import 'package:pianostudent/core/model/userinfo/user.dart';
import 'package:pianostudent/core/utils/common/color_utils.dart';
import 'package:pianostudent/core/utils/res/gaps.dart';
import 'package:pianostudent/services/api/apicode/api.dart';
import 'package:pianostudent/services/api/http_service_impl.dart';
import 'package:pianostudent/services/locator.dart';
import 'package:pianostudent/services/repositories_auth/auth_service.dart';
import 'package:pianostudent/ui/widgets/buttons/gradient_button.dart';

import '../custom/base_dialog_wrapper.dart';

class ChangeSexDialog extends StatefulWidget {
  final int gender;
  ChangeSexDialog({this.gender});
  @override
  _ChangeSexDialogState createState() => _ChangeSexDialogState();
}

class _ChangeSexDialogState extends State<ChangeSexDialog> {
  final _authService = locator<AuthService>();
  SexEnum _avtive = SexEnum.man;

  void _tappedCancel() async {
    print("点击取消");
    Navigator.pop(context);
  }

  void _tappedSure() async {
    User userStore = _authService.currentUser;

    var params = Map<String, dynamic>();
    params["id"] = userStore.id;
    params["gender"] = (_avtive == SexEnum.man) ? 1 : 2;

    var res = await httpService.request(ApiCode.UPDATE_USERINFO, params);
    if (res.data["code"] == 0) {
      _authService.updateUserSex(params["gender"]);
      showToast('修改成功');
      Navigator.pop(context);
    } else {
      showToast(res.data["msg"]);
    }
  }

  @override
  void initState() {
    super.initState();
    _avtive = widget.gender == 1 ? SexEnum.man : SexEnum.women;
  }

  @override
  Widget build(BuildContext context) {
    return BaseDialogWrapper(
      title: '性别',
      width: ScreenUtil().setWidth(734),
      height: ScreenUtil().setHeight(592),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(52), vertical: ScreenUtil().setWidth(24)),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  child: _avtive == SexEnum.man
                      ? _wrapperAdvatorImg("assets/images/custom/man.png", true)
                      : _wrapperAdvatorImg("assets/images/custom/man.png", false),
                  onTap: () {
                    if (_avtive != SexEnum.man) {
                      setState(() {
                        _avtive = SexEnum.man;
                      });
                    }
                  },
                ),
                // Gaps.hGap20,
                GestureDetector(
                  child: _avtive == SexEnum.women
                      ? _wrapperAdvatorImg("assets/images/custom/women.png", true)
                      : _wrapperAdvatorImg("assets/images/custom/women.png", false),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(104)),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              ),
            ),
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
