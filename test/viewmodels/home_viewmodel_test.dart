import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertemplate/core/app/app.bottomsheets.dart';
import 'package:fluttertemplate/core/app/app.locator.dart';
import 'package:fluttertemplate/ui/common/app_strings.dart';
import 'package:fluttertemplate/ui/views/home/home_view/home_view_model.dart';
import 'package:mockito/mockito.dart';

import '../helpers/test_helpers.dart';

void main() {
  HomeViewModel getModel() => HomeViewModel();

  group('HomeViewmodelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    group('incrementCounter -', () {
      test('When called once should return  Counter is: 1', () {
        final model = getModel();
        model.incrementCounter();
        expect(model.counterLabel, 'Counter is: 1');
      });
    });
  });
}
