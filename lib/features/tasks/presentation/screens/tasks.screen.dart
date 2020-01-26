import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/features/tasks/presentation/providers/tasks.provider.dart';
import 'package:simple_todo/features/tasks/presentation/screens/tasks.style.dart';
import 'package:simple_todo/features/tasks/presentation/widgets/addTask.dart';
import 'package:simple_todo/features/tasks/presentation/widgets/body.dart';
import 'package:simple_todo/features/tasks/presentation/widgets/header.dart';

class TasksScreen extends StatefulWidget {
  static const ROUTE_NAME = "/";
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<TasksProvider>(context, listen: false).refreshTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      floatingActionButton: FloatingActionButton(
          backgroundColor: mainColor,
          onPressed: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => const AddTask());
          },
          child: const Icon(Icons.add)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Header(),
          Body(),
        ],
      ),
    );
  }
}
