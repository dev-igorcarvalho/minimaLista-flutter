import 'package:MinimaList/features/tasks/presentation/providers/tasks.store.dart';
import 'package:MinimaList/features/tasks/presentation/screens/tasks.style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/locators/service.locator.dart';
import '../screens/tasks.style.dart';

class AddTask extends StatelessWidget {
  AddTask({
    Key key,
  }) : super(key: key);

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
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
                  sl<TasksStore>().addTask();
                  _textEditingController.clear();
                },
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: mainColor)),
                ),
                autofocus: false,
                textAlign: TextAlign.center,
                onChanged: (newText) {
                  sl<TasksStore>().addTaskInput = newText;
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: mainColor,
              onPressed: () {
                sl<TasksStore>().addTask();
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
