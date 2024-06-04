import 'package:dars_49/controllers/reminder_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReminderScreen extends StatelessWidget {
  final TextEditingController _reminderController = TextEditingController();

  void _showAddReminderDialog(BuildContext context) {
    _reminderController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Reminder'),
          content: TextField(
            controller: _reminderController,
            decoration: InputDecoration(hintText: 'Reminder'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Provider.of<ReminderController>(context, listen: false)
                    .addReminder(_reminderController.text);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showEditReminderDialog(BuildContext context, int index) {
    _reminderController.text =
        Provider.of<ReminderController>(context, listen: false)
            .reminders[index]
            .title;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Reminder'),
          content: TextField(
            controller: _reminderController,
            decoration: InputDecoration(hintText: 'Reminder'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Provider.of<ReminderController>(context, listen: false)
                    .editReminder(index, _reminderController.text);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Eslatmalar'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddReminderDialog(context),
          ),
        ],
      ),
      body: Consumer<ReminderController>(
        builder: (context, reminderController, child) {
          return ListView.builder(
            itemCount: reminderController.reminders.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(reminderController.reminders[index].title),
                onTap: () => _showEditReminderDialog(context, index),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _showEditReminderDialog(context, index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Provider.of<ReminderController>(context, listen: false)
                            .deleteReminder(index);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
