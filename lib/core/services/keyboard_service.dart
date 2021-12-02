import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:stacked/stacked.dart';

class KeyboardService with ReactiveServiceMixin {
  ReactiveValue<bool> _isKeyboardVisible = ReactiveValue<bool>(false);
  bool get isKeyboardVisible => _isKeyboardVisible.value;

  KeyboardService() {
    listenToReactiveValues([_isKeyboardVisible]);
    KeyboardVisibilityController().onChange.listen((bool visible) {
      _isKeyboardVisible.value = visible;
    });
  }
}
