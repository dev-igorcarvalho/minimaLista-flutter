import 'package:MinimaList/features/tasks/presentation/screens/tasks.screen.dart';
import 'package:flutter/widgets.dart';

enum ApiEnvironment { DEV, PROD }

class RoutesLocator {
  static const ApiEnvironment _apiEnvironment = ApiEnvironment.DEV;

  static Map<String, WidgetBuilder> get routes => {
        //initial route tem q ser somente /
        TasksScreen.ROUTE_NAME: (BuildContext context) => TasksScreen(),
        //rotas com o nome relacionado ao widget que elas chamam
//        '/myApp': (BuildContext context) => SimpleTodo(),

        // a linha abaixo eh um exemplo de como evitar erros no nome das rotas
        // usando um atributo de classe com nome da rota na sua propria classe
        //ExampleScreen.route :  (BuildContext context) => ExampleScreen()
      };

  static String getApiUri() {
    switch (_apiEnvironment) {
      case ApiEnvironment.DEV:
        return 'http://localhost:8080';
        break;
      case ApiEnvironment.PROD:
        return 'Algum endpoint real ...';
        break;
      default:
        return '';
        break;
    }
  }
}
