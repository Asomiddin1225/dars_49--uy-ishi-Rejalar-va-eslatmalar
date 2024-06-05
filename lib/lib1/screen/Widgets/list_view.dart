import 'package:dars_49/lib1/page/charGPT.dart';
import 'package:dars_49/lib1/page/flutter_page.dart';
import 'package:dars_49/lib1/page/phpPage.dart';

import 'package:dars_49/lib2/controllers/settings_controller.dart';
import 'package:flutter/material.dart';

class TaskListView extends StatelessWidget {
  final SettingsController settingsController;

  TaskListView({required this.settingsController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FlutterPage()),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    'Flutter',
                    style: TextStyle(
                      color: settingsController.bodyTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PHPpage()),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green,
                ),
                child: Center(
                  child: Text(
                    'PHP',
                    style: TextStyle(
                      color: settingsController.bodyTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatGPTpage()),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.red,
                ),
                child: Center(
                  child: Text(
                    'ChatGPT',
                    style: TextStyle(
                      color: settingsController.bodyTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
