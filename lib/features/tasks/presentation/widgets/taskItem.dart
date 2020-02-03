import 'package:MinimaList/features/tasks/data/models/taskEntityImpl.dart';
import 'package:MinimaList/features/tasks/presentation/providers/tasks.store.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/checkboxOrTrash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  final TaskEntityImpl task;

  const TaskItem({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: () {
          Provider.of<TasksStore>(context, listen: false).changeListAction();
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
