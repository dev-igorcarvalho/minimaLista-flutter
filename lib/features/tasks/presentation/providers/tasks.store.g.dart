// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TasksStore on _TasksStore, Store {
  Computed<bool> _$isListActionCheckBoxComputed;

  @override
  bool get isListActionCheckBox => (_$isListActionCheckBoxComputed ??=
          Computed<bool>(() => super.isListActionCheckBox))
      .value;
  Computed<bool> _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading)).value;
  Computed<int> _$totalOfTasksComputed;

  @override
  int get totalOfTasks =>
      (_$totalOfTasksComputed ??= Computed<int>(() => super.totalOfTasks))
          .value;

  final _$taskListAtom = Atom(name: '_TasksStore.taskList');

  @override
  ObservableList<TaskEntityImpl> get taskList {
    _$taskListAtom.context.enforceReadPolicy(_$taskListAtom);
    _$taskListAtom.reportObserved();
    return super.taskList;
  }

  @override
  set taskList(ObservableList<TaskEntityImpl> value) {
    _$taskListAtom.context.conditionallyRunInAction(() {
      super.taskList = value;
      _$taskListAtom.reportChanged();
    }, _$taskListAtom, name: '${_$taskListAtom.name}_set');
  }

  final _$_isLoadingAtom = Atom(name: '_TasksStore._isLoading');

  @override
  bool get _isLoading {
    _$_isLoadingAtom.context.enforceReadPolicy(_$_isLoadingAtom);
    _$_isLoadingAtom.reportObserved();
    return super._isLoading;
  }

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.context.conditionallyRunInAction(() {
      super._isLoading = value;
      _$_isLoadingAtom.reportChanged();
    }, _$_isLoadingAtom, name: '${_$_isLoadingAtom.name}_set');
  }

  final _$_isListActionCheckBoxAtom =
      Atom(name: '_TasksStore._isListActionCheckBox');

  @override
  bool get _isListActionCheckBox {
    _$_isListActionCheckBoxAtom.context
        .enforceReadPolicy(_$_isListActionCheckBoxAtom);
    _$_isListActionCheckBoxAtom.reportObserved();
    return super._isListActionCheckBox;
  }

  @override
  set _isListActionCheckBox(bool value) {
    _$_isListActionCheckBoxAtom.context.conditionallyRunInAction(() {
      super._isListActionCheckBox = value;
      _$_isListActionCheckBoxAtom.reportChanged();
    }, _$_isListActionCheckBoxAtom,
        name: '${_$_isListActionCheckBoxAtom.name}_set');
  }

  final _$addTaskInputAtom = Atom(name: '_TasksStore.addTaskInput');

  @override
  String get addTaskInput {
    _$addTaskInputAtom.context.enforceReadPolicy(_$addTaskInputAtom);
    _$addTaskInputAtom.reportObserved();
    return super.addTaskInput;
  }

  @override
  set addTaskInput(String value) {
    _$addTaskInputAtom.context.conditionallyRunInAction(() {
      super.addTaskInput = value;
      _$addTaskInputAtom.reportChanged();
    }, _$addTaskInputAtom, name: '${_$addTaskInputAtom.name}_set');
  }

  final _$refreshTaskListAsyncAction = AsyncAction('refreshTaskList');

  @override
  Future<void> refreshTaskList() {
    return _$refreshTaskListAsyncAction.run(() => super.refreshTaskList());
  }

  final _$fetchTaskListAsyncAction = AsyncAction('fetchTaskList');

  @override
  Future<List<TaskEntityImpl>> fetchTaskList() {
    return _$fetchTaskListAsyncAction.run(() => super.fetchTaskList());
  }

  final _$addTaskAsyncAction = AsyncAction('addTask');

  @override
  Future<void> addTask() {
    return _$addTaskAsyncAction.run(() => super.addTask());
  }

  final _$completeTaskAsyncAction = AsyncAction('completeTask');

  @override
  Future<void> completeTask(TaskEntityImpl entity) {
    return _$completeTaskAsyncAction.run(() => super.completeTask(entity));
  }

  final _$deleteTaskAsyncAction = AsyncAction('deleteTask');

  @override
  Future<void> deleteTask(TaskEntityImpl entity) {
    return _$deleteTaskAsyncAction.run(() => super.deleteTask(entity));
  }

  final _$_TasksStoreActionController = ActionController(name: '_TasksStore');

  @override
  void changeListAction() {
    final _$actionInfo = _$_TasksStoreActionController.startAction();
    try {
      return super.changeListAction();
    } finally {
      _$_TasksStoreActionController.endAction(_$actionInfo);
    }
  }
}
