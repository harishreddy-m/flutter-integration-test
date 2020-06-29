import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_app/main.dart' as app;
import 'package:test/test.dart';


void main() {
  // This line enables the extension
  enableFlutterDriverExtension();

  // Call the `main()` function of your app or call `runApp` with any widget you
  // are interested in testing.
  app.main();

  group('happy path integration tests', () {
    final counterTextFinder = find.byValueKey('createProfileBtn');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });


    test('Rules screen is shown', () async {
      expect(await driver.getText(counterTextFinder), "Create Profile");
    });

    // NOTE one more test to come in the next step!
  });
}