import 'package:MinimaList/features/tasks/data/datasource/taskDatasourceImpl.dart';
import 'package:MinimaList/features/tasks/presentation/providers/tasks.store.dart';
import 'package:get_it/get_it.dart';

/// Arquivo responsavel pela injeçao de dependencias

// cria instancia do Service Locator
final GetIt sl = GetIt.instance;

//metodo que sera chamado no main do app para iniciar o processo de injecao de dependencias
void initServiceLocator() {
  _initModules();
  _initCore();
}

//responsavel pela injecao dos features
void _initModules() {
  sl.registerFactory(() => TaskDatasourceImpl());
  sl.registerLazySingleton(() => TasksStore(sl<TaskDatasourceImpl>()));
}

//responsavel pela injecao do core
void _initCore() {}

// void init... responsavel pela injecao do que vc quiser etc
