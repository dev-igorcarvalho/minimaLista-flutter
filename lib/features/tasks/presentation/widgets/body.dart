import 'package:MinimaList/features/tasks/presentation/providers/tasks.provider.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/loading.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/taskList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Provider.of<TasksProvider>(context).isLoading
            ? Loading()
            : TasksList(),
      ),
    );
  }
}
