import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter', () {
    final counterText = find.byValueKey('counter');
    final incrementButton = find.byValueKey('increment');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterText), "0");
    });

    test('increments the counter', () async {
      // Simulate wait for 2 seconds.
      await Future.delayed((Duration(milliseconds: 2000)));
      // First, tap the button.
      await driver.tap(incrementButton);
      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterText), "1");
    });
  });
}