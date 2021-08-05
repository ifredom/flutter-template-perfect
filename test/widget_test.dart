//这是一个基本的flutter小部件测试。

//要在测试中执行与小部件的交互，请使用flutter提供的  WidgetTester utility

// 例如，您可以发送点击和滚动手势。您还可以使用widgetter在小部件中查找子小部件树、读取文本并验证小部件属性的值是否正确。

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluter_template_perfect/ui/root/root_component.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(RootComponent());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
