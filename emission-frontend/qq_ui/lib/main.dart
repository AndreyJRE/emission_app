import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qq_ui/listeners/emissionValut.dart';
import 'package:qq_ui/src/views/controll_view.dart';
import 'package:qq_ui/src/views/login_view.dart';

import 'src/views/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  EmissionVault temp = EmissionVault();
  runApp(    ChangeNotifierProvider<EmissionVault>(
      create: (context) => temp,
      child: ControllView(),
    ));
}
