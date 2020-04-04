/// A value mapping the View UI to the state in the Model.
enum ViewState {
  /// When nothing is happening or just initialized
  /// 什么都没有发生或只是初始化

  Idle,

  /// Typically shows a loading indicator of some sorts
  /// 通常会显示某种负载指示器
  Busy,

  /// Indicates that there's data available on the view
  /// 指示视图上有可用数据
  DataFetched,

  /// Indicates that data was fetched successfully but nothing is available
  /// 表示已成功获取数据，但无可用数据
  NoDataAvailable,

  /// Indicates there's an error on the view
  /// 指示视图中有错误
  Error,

  /// Successful action occurred
  /// 操作成功
  Success,

  /// The starting state that a form view is in
  /// 表单视图所处的起始状态
  WaitingForInput
}
