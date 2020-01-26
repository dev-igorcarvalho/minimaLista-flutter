import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_todo/core/locators/routes.locator.dart';
import 'package:simple_todo/core/locators/service.locator.dart';
import 'package:simple_todo/features/tasks/presentation/providers/tasks.provider.dart';

class ApplicationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TasksProvider>(
            create: (context) => sl<TasksProvider>())
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: RoutesLocator.routes,
      ),
    );
  }
}
