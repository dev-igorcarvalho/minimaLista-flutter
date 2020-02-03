import 'package:MinimaList/features/tasks/presentation/providers/tasks.store.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/loading.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/taskList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Observer(
          builder: (_) => Provider.of<TasksStore>(context).isLoading
              ? Loading()
              : TasksList(),
        ),
      ),
    );
  }
}
