// import 'package:flutter/material.dart';
import 'package:template/core/enums/view_state.dart';

import '../base_view_model.dart';

class TeacherHomeModel extends BaseViewModel {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;
  num _length = 0;
  num _activeMenuIndex = 1;
  num _studentDialogMenuIndex = 1;
  num get studentDialogMenuIndex => _studentDialogMenuIndex;
  num get activeMenuIndex => _activeMenuIndex;
  num get length => _length;


  void changeMenuIndex(num index) {
    _activeMenuIndex = index;
    switch (index) {
      case 2:
        _length = 3;
        break;
      case 3:
        _length = 2;
        break;
      case 4:
        _length = 3;
        break;
      default:
      _length = 0;
    }
    notifyListeners();
  }
  void changeStudentMenuIndex(num index) {
    _studentDialogMenuIndex = index;
    notifyListeners();
  }

  Future<void> init() async {
    setState(ViewState.Busy);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
