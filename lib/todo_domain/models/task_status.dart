import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'task_status.g.dart';

class TaskStatus extends EnumClass {
  static const TaskStatus done = _$done;
  static const TaskStatus progress = _$progress;
  static const TaskStatus pending = _$pending;

  const TaskStatus._(String name) : super(name);

  static BuiltSet<TaskStatus> get values => _$values;
  static TaskStatus valueOf(String name) => _$valueOf(name);
}
