class Result<F, S> {
  final F? failure;
  final S? success;

  Result({this.failure, this.success});

  factory Result.failed(F fail) => Result(failure: fail, success: null);
  factory Result.success(S result) => Result(failure: null, success: result);

  bool isSuccess() {
    if (failure != null || success == null) return false;
    return true;
  }

  bool get isFailed => !isSuccess();
}
