//项目请求接口
class ApiCode {
  /// 登录接口
  static const String SIGN_IN = 'user.v1.0.userLogin';

  /// 获取验证码
  static const String GET_CODE = 'yxcode.getCode';

  /// 查询是否新用户
  static const String ISNEW_USER = 'user.v1.0.checkIsNewUser';

  /// 查询用户信息
  static const String CHECK_USERINFO = 'user.v1.0.info';

  /// 修改用户信息
  static const String UPDATE_USERINFO = 'user.v1.0.update';

  /// 修改用户密码
  static const String RESET_PASSWORD = 'user.v1.0.resetPwd';

  /// 修改用户密码
  static const String USER_BALANCE = 'userwallet.v1.0.getUserBalance';

  /// 获取乐曲列表（分页）
  static const String TEACHINGBOOK_LIST = 'teachingbook.v1.0.list';
}
