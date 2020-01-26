import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/features/tasks/data/models/taskEntityImpl.dart';
import 'package:simple_todo/features/tasks/presentation/providers/tasks.provider.dart';
import 'package:simple_todo/features/tasks/presentation/screens/tasks.style.dart';

class TaskItem extends StatelessWidget {
  final TaskEntityImpl task;

  const TaskItem({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        Provider.of<TasksProvider>(context, listen: false).changeListAction();
      },
      title: Text(
        task.name,
        style: TextStyle(
            decoration: task.completed ? TextDecoration.lineThrough : null),
      ),
      trailing: Provider.of<TasksProvider>(context, listen: false)
              .isListActionCheckBox
          ? Checkbox(
              activeColor: mainColor,
              value: task.completed,
              onChanged: (value) {
                Provider.of<TasksProvider>(context, listen: false)
                    .completeTask(task);
              },
            )
          : GestureDetector(
              onTap: () {
                Provider.of<TasksProvider>(context, listen: false)
                    .deleteTask(task);
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12.5),
                child: Icon(Icons.delete),
              )),
    );
  }
}
