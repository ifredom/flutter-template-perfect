import 'package:oktoast/oktoast.dart';
import 'package:template/api/api.dart';
import 'package:template/api/http.dart';
import 'package:template/core/services/auth/auth_service.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';
import 'package:template/locator.dart';
import '../base_view_model.dart';

class CompletematerialIndexViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();

  String _usetType;
  String get usetType => _usetType;

  Future selectedUserType(String type) async {
    String id = await LocalStorage.get(LocalStorageKeys.USER_ID);
    Map<String, dynamic> params = Map();
    params["id"] = id;
    params["userType"] = type;

    var res = await httpUtil.request(ApiCode.UPDATE_USERINFO, params);

    if (res.data["code"] == 0) {
      _authService.updateUserType(type);
    } else {
      showToast(res.data["msg"]);
    }
  }
}
