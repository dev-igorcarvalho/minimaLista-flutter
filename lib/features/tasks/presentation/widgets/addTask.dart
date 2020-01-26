import 'package:MinimaList/features/tasks/data/models/taskEntityImpl.dart';
import 'package:MinimaList/features/tasks/presentation/providers/tasks.provider.dart';
import 'package:MinimaList/features/tasks/presentation/screens/tasks.style.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
          padding:
              const EdgeInsets.only(left: 40, top: 20, right: 50, bottom: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor)),
                ),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  _inputValue = newText;
                },
              ),
              const SizedBox(height: 20),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                color: Colors.white,
                onPressed: () {
                  if (_inputValue != null) {
                    Provider.of<TasksProvider>(context, listen: false)
                        .addTask(TaskEntityImpl(name: _inputValue));
                  }
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 20,
                    color: mainColor,
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
