import 'package:MinimaList/features/tasks/presentation/providers/tasks.provider.dart';
import 'package:MinimaList/features/tasks/presentation/screens/tasks.style.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/body.dart';
import 'package:MinimaList/features/tasks/presentation/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
