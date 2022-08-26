import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:todo_app/config_domain/app_model/app_status.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';

part 'todo_state.g.dart';

abstract class TodoState implements Built<TodoState, TodoStateBuilder> {
  BuiltList<Task>? get tasks;

  String? get locale;

  Status? get status;

  String? get viewIndex;

  BuiltList<double>? get percents;

  int? get totalTasks;

  TodoState._();
  factory TodoState([void Function(TodoStateBuilder) updates]) = _$TodoState;

  factory TodoState.initial(
      {BuiltList<Task>? tasks, String? locale, Status? status}) {
    return TodoState((b) => b
      ..tasks = BuiltList<Task>([]).toBuilder()
      ..locale = 'en'
      ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
      ..totalTasks = 0
      ..status = Status.idle);
  }
}
