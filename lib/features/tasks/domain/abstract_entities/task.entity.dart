import 'package:MinimaList/core/generics/generic.entity.dart';

abstract class TaskEntity implements GenericEntity {
  String name;
  bool completed;
}
