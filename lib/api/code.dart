class Code {
  static const int NETWORK_ERROR = -1;
  static const int NETWORK_TIMEOUT = -2;
  static const int NETWORK_JSON_EXCEPTION = -3;
  static const SUCCESS = 200;

  static errorHandleFunction(code, message, isNoTip) {
    if (isNoTip) {
      return message;
    }
    // eventBus.dispatch(new HttpErrorEvent(code, message));
    return message;
  }
}
