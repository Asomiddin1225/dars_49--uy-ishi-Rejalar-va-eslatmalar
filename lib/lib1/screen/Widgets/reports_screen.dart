import 'package:dars_49/lib1/controllers/task_controller.dart';
import 'package:dars_49/lib1/controllers/reminder_controller.dart'; // Add this import
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<TaskController, ReminderController>(
      builder: (context, taskController, reminderController, child) {
        int completedTasks =
            taskController.tasks.where((task) => task.completed).length;
        int remainingTasks = taskController.tasks.length - completedTasks;
        int remindersCount = reminderController.reminders.length;

        return Scaffold(
          appBar: AppBar(
            title: Text('Natijalar'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Bajarilgan topshiriqlar soni: $completedTasks',
                      style: TextStyle(fontSize: 30, color: Colors.green),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Bajarilmagan topshiriqlar soni: $remainingTasks',
                      style: TextStyle(fontSize: 30, color: Colors.red),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Eslatmalar soni: $remindersCount',
                      style: TextStyle(fontSize: 30, color: Colors.blue),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
