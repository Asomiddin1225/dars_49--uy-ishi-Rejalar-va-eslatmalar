import 'package:dars_49/lib1/controllers/task_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskScreen extends StatelessWidget {
  TextEditingController _taskController = TextEditingController();

  void _showAddTaskDialog(BuildContext context) {
    _taskController.clear();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Reja Qo'shish"),
          content: TextField(
            controller: _taskController,
            decoration: InputDecoration(hintText: 'Task Title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Bekor qilish"),
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskController>(context, listen: false)
                    .addTask(_taskController.text);
                Navigator.of(context).pop();
              },
              child: Text("Saqla"),
            ),
          ],
        );
      },
    );
  }

  void _showEditTaskDialog(BuildContext context, int index) {
    _taskController.text =
        Provider.of<TaskController>(context, listen: false).tasks[index].title;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Task'),
          content: TextField(
            controller: _taskController,
            decoration: InputDecoration(hintText: 'Task Title'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Bekor qilish"),
            ),
            TextButton(
              onPressed: () {
                Provider.of<TaskController>(context, listen: false)
                    .editTask(index, _taskController.text);
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
        title: Text('Rejalar'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showAddTaskDialog(context),
          ),
        ],
      ),
      body: Consumer<TaskController>(
        builder: (context, taskController, child) {
          return ListView.builder(
            itemCount: taskController.tasks.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  taskController.tasks[index].title,
                  style: TextStyle(
                    color: taskController.tasks[index].completed
                        ? Colors.green
                        : Colors.red,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => _showEditTaskDialog(context, index),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        Provider.of<TaskController>(context, listen: false)
                            .deleteTask(index);
                      },
                    ),
                    Checkbox(
                      value: taskController.tasks[index].completed,
                      onChanged: (value) {
                        taskController.toggleTaskCompletion(index);
                      },
                    ),
                  ],
                ),
                onTap: () => _showEditTaskDialog(context, index),
              );
            },
          );
        },
      ),
    );
  }
}
