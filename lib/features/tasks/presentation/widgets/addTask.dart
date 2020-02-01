import 'package:MinimaList/features/tasks/presentation/screens/tasks.style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/tasks.provider.dart';

class AddTask extends StatelessWidget {
  AddTask({
    Key key,
  }) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.only(left: 40, top: 0, right: 35, bottom: 20),
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _textEditingController,
                onSubmitted: (value) {
                  Provider.of<TasksProvider>(context, listen: false).addTask();
                  _textEditingController.clear();
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor)),
                ),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  Provider.of<TasksProvider>(context, listen: false)
                      .addTaskInput = newText;
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Provider.of<TasksProvider>(context, listen: false).addTask();
                _textEditingController.clear();
                FocusScope.of(context).unfocus();
              },
            )
          ],
        ),
      ),
    );
  }
}
