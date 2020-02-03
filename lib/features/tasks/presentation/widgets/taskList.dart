import 'package:MinimaList/features/tasks/presentation/providers/tasks.store.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/taskItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/locators/service.locator.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ListView.builder(
        itemBuilder: (context, index) {
          return TaskItem(
            task: sl<TasksStore>().taskList[index],
          );
        },
        itemCount: sl<TasksStore>().taskList.length,
      ),
    );
  }
}
