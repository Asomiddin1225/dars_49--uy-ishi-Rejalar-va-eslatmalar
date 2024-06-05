

import 'package:dars_49/lib1/model/reminder_controller.dart.dart';
import 'package:flutter/material.dart';

class ReminderController with ChangeNotifier {
  List<Reminder> _reminders = [
    Reminder(title: 'Eslatma 1'),
    Reminder(title: 'Eslatma 2'),
    Reminder(title: 'Eslatma 3'),
  ];

  List<Reminder> get reminders => _reminders;

  void addReminder(String title) {
    _reminders.add(Reminder(title: title));
    notifyListeners();
  }

  void editReminder(int index, String title) {
    _reminders[index].title = title;
    notifyListeners();
  }

  void deleteReminder(int index) {
    _reminders.removeAt(index);
    notifyListeners();
  }
}
