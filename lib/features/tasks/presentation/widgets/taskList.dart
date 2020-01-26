import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/features/tasks/presentation/providers/tasks.provider.dart';
import 'package:simple_todo/features/tasks/presentation/widgets/taskItem.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TasksProvider>(
      builder: (context, provider, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskItem(
              task: provider.taskList[index],
            );
          },
          itemCount: provider.getTotalOfTasks(),
        );
      },
    );
  }
}
