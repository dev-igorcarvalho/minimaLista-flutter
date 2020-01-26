import 'package:MinimaList/features/tasks/data/models/taskEntityImpl.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/checkboxOrTrash.dart';
import 'package:flutter/material.dart';

class TaskItem extends StatelessWidget {
  final TaskEntityImpl task;

  const TaskItem({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
