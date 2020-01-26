import 'dart:collection';

import 'package:MinimaList/features/tasks/data/datasource/taskDatasourceImpl.dart';
import 'package:MinimaList/features/tasks/data/models/taskEntityImpl.dart';
import 'package:flutter/foundation.dart';
import 'package:simple_logger/simple_logger.dart';

class TasksProvider with ChangeNotifier {
  // Singleton (factory)
  final _logger = SimpleLogger();

  final TaskDatasourceImpl dataSource;

  List<TaskEntityImpl> _taskList;

  bool _isLoading = false;

  bool _isListActionCheckBox = true;

  String addTaskInput;

  TasksProvider(this.dataSource);

  bool get isLoading => _isLoading;

  bool get isListActionCheckBox => _isListActionCheckBox;

  void changeListAction() {
    _isListActionCheckBox = !_isListActionCheckBox;
    notifyListeners();
  }

  /// Retorna copia imutavel da lista por segurança
  List<TaskEntityImpl> get taskList {
    return UnmodifiableListView<TaskEntityImpl>(_taskList);
  }

  Future<void> refreshTaskList() async {
    _isLoading = true;
    _taskList = await getTaskList();
    _isLoading = false;
    notifyListeners();
  }

  Future<List<TaskEntityImpl>> getTaskList() async {
    final result = await dataSource.fetchAll();
    return result;
  }

  int getTotalOfTasks() {
    return _taskList?.length;
  }

  Future<void> addTask(TaskEntityImpl entity) async {
    _logger.info("Adding Task : ${entity.name}");
    await dataSource.insert(entity);
    await refreshTaskList();
  }

  Future<void> completeTask(TaskEntityImpl entity) async {
    _logger.info("Completed Task : ${entity.name}");
    entity.changeStatus();
    await dataSource.update(entity);
    await refreshTaskList();
  }

  Future<void> deleteTask(TaskEntityImpl entity) async {
    _logger.info("Delete Task : ${entity.name}");
    await dataSource.delete(entity);
    await refreshTaskList();
  }
}
