import 'package:flutter/material.dart';

import 'app.dart';
import 'config/define.dart';
import 'config/settings_service.dart';
import 'di/define.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set up environment
  const flavor = String.fromEnvironment("env");
  FlavorConfig(
      flavor: flavor == Flavor.prod.getName()
          ? Flavor.prod
          : (flavor == Flavor.stg.getName() ? Flavor.stg : Flavor.dev));

  // Set up dependencies injection
  await configureDependencies();

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = Settings(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
