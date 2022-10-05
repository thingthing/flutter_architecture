// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.

import 'package:flutter_architecture/app.dart';
import 'package:flutter_architecture/settings/settings_controller.dart';
import 'package:flutter_architecture/settings/settings_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MyWidget', () {
    testWidgets('should display a string of text', (WidgetTester tester) async {
      final SettingsController settingsController =
          SettingsController(SettingsService());

      // Load the user's preferred theme while the splash screen is displayed.
      // This prevents a sudden theme change when the app is first displayed.
      await settingsController.loadSettings();

      // Build our app and trigger a frame.
      await tester.pumpWidget(
        MyApp(
          settingsController: settingsController,
        ),
      );

      // Verify myWidget shows some text
      expect(find.textContaining('SampleItem '), findsNWidgets(3));
    });
  });
}
