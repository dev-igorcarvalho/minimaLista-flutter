import 'package:MinimaList/features/tasks/presentation/providers/tasks.provider.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/body.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/addTask.dart';

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
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[const Header(), const Body(), AddTask()],
      ),
    );
  }
}
