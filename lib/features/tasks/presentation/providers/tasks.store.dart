import 'dart:collection';

import 'package:mobx/mobx.dart';
import 'package:simple_logger/simple_logger.dart';

import '../../data/datasource/taskDatasourceImpl.dart';
import '../../data/models/taskEntityImpl.dart';

part 'tasks.store.g.dart';

// This is the class used by rest of your codebase
class TasksStore extends _TasksStore with _$TasksStore {
  TasksStore(TaskDatasourceImpl dataSource) : super(dataSource);
}

// The store-class
abstract class _TasksStore with Store {
  _TasksStore(this.dataSource);

  // Singleton (factory)
  final _logger = SimpleLogger();

  final TaskDatasourceImpl dataSource;

  @observable
  ObservableList<TaskEntityImpl> _taskList;

  @observable
  bool _isLoading = false;

  @observable
  bool _isListActionCheckBox = true;

  @observable
  String addTaskInput;

  @computed
  bool get isListActionCheckBox => _isListActionCheckBox;

  @computed
  bool get isLoading => _isLoading;

  @computed
  int get totalOfTasks => _taskList?.length;

  /// Retorna copia imutavel da lista por segurança
  @computed
  ObservableList<TaskEntityImpl> get taskList {
    final list = UnmodifiableListView<TaskEntityImpl>(_taskList);
    return ObservableList.of(list);
  }

  @action
  void changeListAction() {
    _isListActionCheckBox = !_isListActionCheckBox;
  }

  @action
  Future<void> refreshTaskList() async {
    _isLoading = true;
    final List<TaskEntityImpl> list = await fetchTaskList();
    _taskList = ObservableList.of(list);
    _isLoading = false;
  }

  @action
  Future<List<TaskEntityImpl>> fetchTaskList() async {
    final result = await dataSource.fetchAll();
    return result;
  }

  @action
  Future<void> addTask() async {
    if (addTaskInput == null || addTaskInput.isEmpty) {
      return;
    }
    final TaskEntityImpl entity = TaskEntityImpl(name: addTaskInput);
    addTaskInput = "";
    _logger.info("Adding Task : ${entity.name}");
    await dataSource.insert(entity);
    await refreshTaskList();
  }

  @action
  Future<void> completeTask(TaskEntityImpl entity) async {
    _logger.info("${entity.name} - Complete: ${entity.completed}");
    entity.changeStatus();
    await dataSource.update(entity);
    await refreshTaskList();
  }

  @action
  Future<void> deleteTask(TaskEntityImpl entity) async {
    _logger.info("Delete Task : ${entity.name}");
    await dataSource.delete(entity);
    _isListActionCheckBox = !_isListActionCheckBox;
    await refreshTaskList();
  }
}
