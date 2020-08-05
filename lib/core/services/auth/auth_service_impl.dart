import 'dart:async';
import 'package:logging/logging.dart';
import 'package:template/api/apicode/api.dart';
import 'package:template/api/http_service_impl.dart';
import 'package:template/core/exceptions/auth_exception.dart';
import 'package:template/core/model/userinfo/user.dart';
import 'package:template/core/utils/res/local_storage.dart';
import 'package:template/core/utils/res/local_storage_keys.dart';

import 'auth_service.dart';

//  service 控制层，定义数据变化，定义异步接口请求
// view_model 视图层，连接service,
class AuthServiceImpl implements AuthService {
  final _log = Logger("AuthServiceImpl");
  User _currentUser;
  User get currentUser => _currentUser;

  // 使用stream数据传输通信, 入口sink,出口stream 文章:https://juejin.im/post/5baa4b90e51d450e6d00f12e
  StreamController<User> _userController = StreamController<User>();
  Stream<User> get user => _userController.stream;

  String _userType;
  String get userType => _userType;

  String _invitationCode;
  String get invitationCode => _invitationCode;

  /// 手机号密码登录
  @override
  Future signUpWithAuthPassword(
    String mobile,
    String password,
  ) async {
    try {
      return await httpService.request(ApiCode.SIGN_IN, {
        "mobile": mobile,
        "pwd": password,
      });
    } on Exception {
      _log.severe('AuthServiceImpl: signUpWithAuthcode 接口异常');
      throw AuthException('signUpWithAuthcode 接口异常');
    }
  }

  /// 手机号验证码登录
  @override
  Future signUpWithAuthcode(
    String mobile,
    String authCode,
  ) async {
    try {
      return await httpService.request(ApiCode.SIGN_IN, {
        "mobile": mobile,
        "authCode": authCode,
      });
    } on Exception {
      _log.severe('AuthServiceImpl: signUpWithAuthcode 接口异常');
      throw AuthException('signUpWithAuthcode 接口异常');
    }
  }

  @override
  Future fetchUserInfo(
    String id,
  ) async {
    try {
      return await httpService.request(ApiCode.CHECK_USERINFO, {"id": id});
    } on Exception {
      _log.severe('AuthServiceImpl: fetchUserInfo 接口异常');
      throw AuthException('fetchUserInfo 接口异常');
    }
  }

  @override
  Future fetchResetPassword(
    String vcode,
    String pwd,
  ) async {
    try {
      return await httpService
          .request(ApiCode.RESET_PASSWORD, {"code": vcode, "pwd": pwd});
    } on Exception {
      _log.severe('AuthServiceImpl: fetchResetPassword 接口异常');
      throw AuthException('fetchResetPassword 接口异常');
    }
  }

  @override
  Future fetchIsNewUser(
    String mobile,
    String openId,
  ) async {
    try {
      return await httpService
          .request(ApiCode.ISNEW_USER, {"mobile": mobile, "openId": openId});
    } on Exception {
      _log.severe('AuthServiceImpl: fetchResetPassword 接口异常');
      throw AuthException('fetchResetPassword 接口异常');
    }
  }

  // 登录接口，更新用户信息
  @override
  Future<void> updateCurrentUser(User userinfo) async {
    _currentUser = User(
      (u) => u
        ..id = userinfo.id
        ..token = userinfo.token
        ..mobile = userinfo.mobile
        ..gender = userinfo.gender
        ..nickName = userinfo.nickName
        ..firstTeachingDate = userinfo.firstTeachingDate
        ..detailAddress = userinfo.detailAddress
        ..description = userinfo.description
        ..userType = userinfo.userType
        ..validFlag = userinfo.validFlag
        ..levelCode = userinfo.levelCode
        ..isSetPwd = userinfo.isSetPwd,
    );
  }

  // 查询用户钱包
  @override
  Future fetchUserBalance() async {
    try {
      return await httpService.request(ApiCode.USER_BALANCE, {});
    } on Exception {
      _log.severe('AuthServiceImpl: fetchResetPassword 接口异常');
      throw AuthException('fetchResetPassword 接口异常');
    }
  }

  // https://stackoom.com/question/3UKD6/%E4%BB%80%E4%B9%88%E6%98%AFbuilt-value%E5%AF%B9%E8%B1%A1%E7%9A%84setter
  // 更新用户类型
  @override
  Future<void> updateUserType(String userType) async {
    // 写法二
    // p = (p.toBuilder().type = 'hello world').build();
    // 写法一
    _currentUser = _currentUser.rebuild((u) => u..userType = userType);

    _userType = userType;
  }

  @override
  Future<void> updateUserInvitationCode(String invitationCode) async {
    _invitationCode = invitationCode;
  }

  @override
  Future<void> updateUserNiceName(String nickName) async {
    _currentUser = _currentUser.rebuild((u) => u..nickName = nickName);
  }

  @override
  Future<void> updateUserAddress(String detailAddress) async {
    _currentUser = _currentUser.rebuild((u) => u..detailAddress = detailAddress);
  }

  @override
  Future<void> updateUserDescription(String description) async {
    _currentUser = _currentUser.rebuild((u) => u..description = description);
  }

  @override
  Future<void> updateUserfirstTeachingDate(String year) async {
    _currentUser = _currentUser.rebuild((u) => u..firstTeachingDate = year);
  }

  @override
  Future<void> updateUserSex(int sex) async {
    _currentUser = _currentUser.rebuild((u) => u..gender = sex);
  }

  @override
  Future<void> signOut() async {
    // _userController.close();
    await LocalStorage.clear();
    _currentUser = null;
  }

  @override
  Future<bool> isUserLoggedIn() async {
    // await Future.delayed(Duration(milliseconds: 3000));
    String token = await LocalStorage.get(LocalStorageKeys.TOKEN_KEY);
    return token != null;
  }
}
