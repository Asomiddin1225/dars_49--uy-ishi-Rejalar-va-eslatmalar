

import 'package:dars_49/lib1/screen/Widgets/grid_view.dart';
import 'package:dars_49/lib1/screen/Widgets/list_view.dart';
import 'package:dars_49/lib1/screen/Widgets/reminder_screen.dart';
import 'package:dars_49/lib1/screen/Widgets/task_screen.dart';
import 'package:dars_49/lib2/controllers/settings_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  final SettingsController settingsController;

  const HomeScreen({Key? key, required this.settingsController})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isListView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TaskScreen()),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        'Rejalar',
                        style: TextStyle(
                          color: widget.settingsController.bodyTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ReminderScreen()),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: Text(
                        'Eslatmalar',
                        style: TextStyle(
                          color: widget.settingsController.bodyTextColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.settingsController.appBarColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Text(
                  "Kurslar",
                  style: TextStyle(
                    fontSize: 30,
                    color: widget.settingsController.bodyTextColor,
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      isListView = !isListView;
                    });
                  },
                  icon: Icon(
                    isListView ? Icons.menu : Icons.app_registration,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (isListView)
          Expanded(
            child: TaskListView(
              settingsController: widget.settingsController,
            ),
          )
        else
          Expanded(
            child: TaskGridView(
              settingsController: widget.settingsController,
            ),
          ),
      ],
    );
  }
}
