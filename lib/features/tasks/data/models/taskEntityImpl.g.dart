// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'taskEntityImpl.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskEntityImpl _$TaskEntityImplFromJson(Map<String, dynamic> json) {
  return TaskEntityImpl(
    name: json['name'] as String,
    completed: json['completed'] as bool,
  )..id = json['id'] as int;
}

Map<String, dynamic> _$TaskEntityImplToJson(TaskEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'completed': instance.completed,
    };
