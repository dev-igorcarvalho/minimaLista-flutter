import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:simple_todo/features/tasks/domain/abstract_entities/task.entity.dart';

part 'taskEntityImpl.g.dart';

@JsonSerializable()
class TaskEntityImpl extends TaskEntity {
  @override
  int id;

  @override
  String name;

  @override
  bool completed;

  void changeStatus() {
    completed = !completed;
  }

  TaskEntityImpl({@required this.name, this.completed = false});

  factory TaskEntityImpl.fromJsonMap(Map<String, dynamic> json) =>
      _$TaskEntityImplFromJson(json);

  @override
  Map<String, dynamic> toJsonMap() => _$TaskEntityImplToJson(this);
}
