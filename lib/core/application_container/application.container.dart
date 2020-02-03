import 'package:MinimaList/core/locators/routes.locator.dart';
import 'package:flutter/material.dart';

class ApplicationContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: RoutesLocator.routes,
    );
  }
}
