import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';
import 'package:todo_app/todo_domain/models/task_status.dart';
import 'package:todo_app/todo_domain/repo/abs_repo.dart';

// TODO: implement Hive
class HiveRepo extends AbsRepo {
  static HiveRepo? _instance;
  HiveRepo._internal() {
    _instance = this;
  }
  factory HiveRepo() => _instance ?? HiveRepo._internal();

  BuiltList<Task> tasks = BuiltList<Task>([
    Task.initial(
        id: "1",
        title: "Title 1",
        desc: "Desc 1",
        taskStatus: TaskStatus.pending),
    Task.initial(
        id: "2",
        title: "Title 22",
        desc: "Desc 22",
        taskStatus: TaskStatus.done),
    Task.initial(
        id: "3",
        title: "Title 333",
        desc: "Desc 333",
        taskStatus: TaskStatus.progress),
    Task.initial(
        id: "4",
        title: "Title 4444",
        desc: "Desc 4444",
        taskStatus: TaskStatus.pending),
    Task.initial(
        id: "5",
        title: "Title 55555",
        desc: "Desc 55555",
        taskStatus: TaskStatus.progress),
  ]);

  @override
  create() {
    return tasks;
  }

  @override
  delete(String id) {
    List<Task>? newTasks = tasks.toList();
    newTasks.removeWhere((element) => element.id == id);
    tasks = newTasks.toBuiltList();
  }

  @override
  insert(Task task) {
    tasks.asList().add(task);
  }

  @override
  read() {
    return tasks;
  }

  @override
  update(String id, Task task) {
    List<Task>? newTasks = tasks.toList();
    final index = newTasks.indexWhere((element) => element.id == id);
    newTasks.removeWhere((element) => element.id == id);
    log("after removing: ${newTasks.length}");
    log("NEW TASK: $task");
    newTasks.insert(index, task);
    tasks = newTasks.toBuiltList();
  }
}
