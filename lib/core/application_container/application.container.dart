import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/core/locators/routes.locator.dart';
import 'package:simple_todo/features/tasks/presentation/providers/tasks.provider.dart';

class ApplicationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      child: MaterialApp(
        initialRoute: "/",
        routes: RoutesLocator.routes,
      ),
    );
  }
}
