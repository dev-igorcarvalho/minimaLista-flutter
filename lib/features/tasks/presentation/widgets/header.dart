import 'package:MinimaList/features/tasks/presentation/providers/tasks.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../screens/tasks.style.dart';

class Header extends StatelessWidget {
  const Header({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 50.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Observer(
            name: "Header.computed.totalOfTasks",
            builder: (_) => Text(
              '${Provider.of<TasksStore>(context).totalOfTasks} Itens',
              style: const TextStyle(
                color: mainColor,
                fontSize: 18,
              ),
            ),
          ),
          const Divider(
            color: mainColor,
            height: 20,
            thickness: 1,
          )
        ],
      ),
    );
  }
}
