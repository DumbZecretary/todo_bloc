import 'package:built_value/built_value.dart';
import 'package:todo_app/todo_domain/models/task_status.dart';

part 'task_model.g.dart';

abstract class Task implements Built<Task, TaskBuilder> {
  String? get id;

  String? get title;

  String? get desc;

  TaskStatus? get status;

  Task._();
  factory Task([void Function(TaskBuilder) updates]) = _$Task;

  factory Task.initial(
      {required String id,
      required String title,
      String? desc,
      TaskStatus? taskStatus}) {
    return Task((b) => b
      ..id = id
      ..title = title
      ..desc = desc ?? " "
      ..status = taskStatus ?? TaskStatus.pending);
  }
}
