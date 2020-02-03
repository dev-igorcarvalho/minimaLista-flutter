import 'package:MinimaList/core/locators/routes.locator.dart';
import 'package:MinimaList/core/locators/service.locator.dart';
import 'package:MinimaList/features/tasks/presentation/providers/tasks.provider.dart';
import 'package:MinimaList/features/tasks/presentation/providers/tasks.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ApplicationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TasksProvider>(
            create: (context) => sl<TasksProvider>()),
        Provider<TasksStore>(create: (context) => sl<TasksStore>())
      ],
      child: MaterialApp(
        initialRoute: "/",
        routes: RoutesLocator.routes,
      ),
    );
  }
}
