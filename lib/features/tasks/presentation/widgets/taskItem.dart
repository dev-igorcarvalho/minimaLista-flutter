import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/features/tasks/data/models/taskEntityImpl.dart';
import 'package:simple_todo/features/tasks/presentation/providers/tasks.provider.dart';

import 'checkboxOrTrash.dart';

class TaskItem extends StatelessWidget {
  final TaskEntityImpl task;

  const TaskItem({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Provider.of<TasksProvider>(context, listen: false).changeListAction();
        },
        title: Text(
          task.name,
          style: TextStyle(
              decoration: task.completed ? TextDecoration.lineThrough : null),
        ),
        trailing: CheckBoxOrTrash(
          task: task,
        ));
  }
}
