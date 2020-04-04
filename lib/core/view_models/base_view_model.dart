import 'package:flutter/widgets.dart';
import 'package:template/core/enums/view_state.dart';

/// Class for view models to extend from. Keeps track
/// of [ViewState] and exposes a function to change the
/// state of the view.
/// https://github.com/cwkProject/lifecycle/blob/288252674d415999b313d17c3ce03b9611bdb812/lifecycle_core/lib/src/view_model.dart

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  bool _disposed = false;

  void setState(ViewState viewState) {
    _state = viewState;

    if (_disposed) return;

    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
