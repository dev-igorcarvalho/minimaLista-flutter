import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/features/tasks/data/models/taskEntityImpl.dart';
import 'package:simple_todo/features/tasks/presentation/providers/tasks.provider.dart';
import 'package:simple_todo/features/tasks/presentation/screens/tasks.style.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _inputValue;

    return SingleChildScrollView(
        child: Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        color: const Color(0xff757575),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: mainColor,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  _inputValue = newText;
                },
              ),
              FlatButton(
                color: mainColor,
                onPressed: () {
                  if (_inputValue != null) {
                    Provider.of<TasksProvider>(context, listen: false)
                        .addTask(TaskEntityImpl(name: _inputValue));
                  }
                  Navigator.pop(context);
                },
                child: const Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
