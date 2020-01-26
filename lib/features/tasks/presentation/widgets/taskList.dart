import 'package:MinimaList/features/tasks/presentation/providers/tasks.provider.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/taskItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
