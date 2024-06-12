import 'package:fluttertemplate/core/app/app.bottomsheets.dart';
import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/core/constants/component_state.dart';
import 'package:fluttertemplate/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  // 初始化，可以做点什么，比如fetch数据，用户信息
  Future<void> onModelReady() async {}

  final _dialogService = locator<DialogService>();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.Basic,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }
}
