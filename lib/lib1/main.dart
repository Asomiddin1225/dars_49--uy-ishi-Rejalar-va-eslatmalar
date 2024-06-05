

import 'package:dars_49/lib1/controllers/profil_controller.dart';
import 'package:dars_49/lib1/controllers/reminder_controller.dart';
import 'package:dars_49/lib1/controllers/task_controller.dart';
import 'package:dars_49/lib2/controllers/settings_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/views/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SettingsController settingsController = SettingsController();
  await settingsController.loadSettings();
  runApp(MyApp(settingsController));
}

class MyApp extends StatelessWidget {
  final SettingsController settingsController;

  MyApp(this.settingsController);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskController()),
        ChangeNotifierProvider(create: (_) => ReminderController()),
        ChangeNotifierProvider(create: (_) => ProfileController()),
      ],
      child: AnimatedBuilder(
        animation: settingsController,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: settingsController.isDarkMode
                ? ThemeData.dark()
                : ThemeData.light(),
            home: HomePage(settingsController),
          );
        },
      ),
    );
  }
}
