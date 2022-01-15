// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:max_clean_arch/presentation/features/splash/widgets/splash_page.dart';
import 'package:max_clean_arch/presentation/generated/assets.gen.dart';

void main() {
  testWidgets('Verify SplashWidget shows the splash image', (WidgetTester tester) async {
    await tester.pumpWidget(SplashPage(
      splashImage: Assets.splash.shoppingSplash,
    ));
    expect(find.byKey(const Key('splash-image')), findsOneWidget);
  });

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());
  //
  //   expect(find.byKey(const Key('splash')), findsOneWidget);
  //
  //
  //   // Verify that our counter starts at 0.
  //   expect(find.text('1'), findsNothing);
  //
  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();
  //
  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
