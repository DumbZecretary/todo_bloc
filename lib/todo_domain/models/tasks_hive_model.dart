import 'package:built_collection/built_collection.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';

part 'tasks_hive_model.g.dart';

@HiveType(typeId: 0)
class ListTaskHiveModel extends HiveObject {
  BuiltList<Task>? tasks;
}
