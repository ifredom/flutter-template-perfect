/// 请求接口地址
class ApiCode {
  /// SOCKET URL
  static const String SOCKET_URL = 'ws://test.youconst xspace.com/webSocket/111/FREE/1';

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

  /// 查询字典类型
  static const String DICT_TYPE = 'datadictionary.v1.0.list';

  /// 查询字典下拉框
  static const String DICT_TYPE_SELECTED = 'datadictionary.option.v1.0.showList';

  /// 商城列表分页查询
  static const String PRODUCT_LIST = 'product.v1.0.list';

  /// 获取乐曲列表（分页）
  static const String TEACHINGBOOK_LIST = 'teachingbook.v1.0.list';

  /// 获取学生今日作业
  static const String STUDENT_TASKLIST = 'task.v1.0.studentTaskList';

  /// 根据id，获取学生作业关卡
  static const String STUDENT_TASKNODELIST = 'tasknode.v1.0.taskNodeList';

  /// 获取学生历史作业
  static const String STUDENT_HISTORYLIST = 'task.v1.0.studentHisTaskList';

  /// 学生-购买商品
  static const String STUDENT_BUY_PRODUCT = 'userknapsack.v1.0.buySomething';

  /// 学生-活动列表
  static const String STUDENT_ACTIVE_LIST = 'activity.v1.0.list';

  /// 学生-活动详情
  static const String STUDENT_ACTIVE_INFO = 'activity.v1.0.info';

  /// 学生-活动详情适配移动端
  static const String STUDENT_ACTIVE_INFO_MOBILE = 'activity.v1.0.info4Mobile';

  /// 查询自己团队下的所有学生
  static const String STUDENT_LIST = "team.v1.0.querySelfTeam";

  /// 教师查询历史作业
  static const String STUDENT_HIS_TASK_LIST = "task.v1.0.teacherQueryHisTaskList";

  /// 查询乐曲列表
  static const String MUSIC_LIST = "music.v1.0.getMusicList";

  /// 查询乐曲列表
  static const String TEACHER_TASK_LIST = "task.v1.0.teacherTaskList";

  /// 查询学生信息
  static const String STUDENT_INFO = "user.v1.0.getStudentInfo";

  /// 查询教案列表
  static const String TEACHING_PLAN = "teachingplan.v1.0.getAllPlanByMusicId";

  /// 匹配最佳教案
  static const String BESE_TEACHING_PLAN = "teachingplan.v1.0.bestMatchTeachingPlan";

  /// 根据乐曲ID查询乐句
  static const String QUERY_BY_MUSICID = "phrase.v1.0.queryByMusicId";

  /// 查询学生程度
  static const String QUERY_MATCH_STUDENT_LEVEL = "teachingtype.v1.0.queryTeachingTypeByStudentLevel";

  /// 留作业
  static const String SAVE_HOMEWORK = "task.v1.0.save";

  /// 弹奏结果查询
  static const String PLAY_RESULT = "play.v1.0.propInfo";
}
