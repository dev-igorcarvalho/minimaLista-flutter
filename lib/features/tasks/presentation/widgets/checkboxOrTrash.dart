import 'package:MinimaList/features/tasks/data/models/taskEntityImpl.dart';
import 'package:MinimaList/features/tasks/presentation/providers/tasks.store.dart';
import 'package:MinimaList/features/tasks/presentation/screens/tasks.style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CheckBoxOrTrash extends StatelessWidget {
  final TaskEntityImpl task;

  const CheckBoxOrTrash({Key key, this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) =>
          Provider.of<TasksStore>(context, listen: false).isListActionCheckBox
              ? Checkbox(
                  activeColor: mainColor,
                  value: task.completed,
                  onChanged: (value) {
                    Provider.of<TasksStore>(context, listen: false)
                        .completeTask(task);
                  },
                )
              : GestureDetector(
                  onTap: () {
                    Provider.of<TasksStore>(context, listen: false)
                        .deleteTask(task);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12.5),
                    child: Icon(Icons.delete),
                  )),
    );
  }
}
