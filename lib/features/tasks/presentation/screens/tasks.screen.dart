import 'package:MinimaList/features/tasks/presentation/providers/tasks.store.dart';
import 'package:MinimaList/features/tasks/presentation/screens/tasks.style.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/body.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/locators/service.locator.dart';
import '../widgets/addTask.dart';

class TasksScreen extends StatefulWidget {
  static const ROUTE_NAME = "/";
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    sl<TasksStore>().refreshTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[const Header(), const Body(), AddTask()],
      ),
    );
  }
}
