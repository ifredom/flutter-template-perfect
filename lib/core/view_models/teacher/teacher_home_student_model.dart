import 'package:template/core/enums/view_state.dart';

import '../base_view_model.dart';

class TeacherHomeStudentModel extends BaseViewModel {
  ViewState _state = ViewState.Idle;

  ViewState get state => _state;
  num _studentDialogMenuIndex = 1;

  String _title = "王小明";
  String get title => _title;
  num get studentDialogMenuIndex => _studentDialogMenuIndex;

  void changeStudentMenuIndex(num index) {
    _studentDialogMenuIndex = index;
    notifyListeners();
  }
  void changeTitle(String title) {
    _title = title;
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
