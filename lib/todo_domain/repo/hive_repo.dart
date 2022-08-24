import 'package:built_collection/built_collection.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';
import 'package:todo_app/todo_domain/models/tasks_hive_model.dart';
import 'package:todo_app/todo_domain/repo/abs_repo.dart';
import 'dart:developer';

class HiveRepo extends AbsRepo {
  static HiveRepo? _instance;
  HiveRepo._internal() {
    _instance = this;
  }
  factory HiveRepo() => _instance ?? HiveRepo._internal();

  BuiltList<Task> _tasks = BuiltList<Task>([]);

  @override
  create() async {
    BuiltList<Task>? tasks = <Task>[].toBuiltList();
    // don't forget to add ListTaskHiveModel or getting bugs
    var hive = Hive.box<ListTaskHiveModel>('tasks');

    ListTaskHiveModel listTasks = ListTaskHiveModel();
    listTasks.tasks = tasks;
    await hive.put('tasks', listTasks);
  }

  @override
  delete(String id) async {
    List<Task>? newTasks = _tasks.toList();
    newTasks.removeWhere((element) => element.id == id);
    _tasks = newTasks.toBuiltList();
    var hive = Hive.box<ListTaskHiveModel>('tasks');
    ListTaskHiveModel listTasks = ListTaskHiveModel();
    listTasks.tasks = _tasks;
    await hive.put('tasks', listTasks);
  }

  @override
  insert(Task task) async {
    List<Task>? newTasks = _tasks.toList();
    newTasks.add(task);
    _tasks = newTasks.toBuiltList();

    var hive = Hive.box<ListTaskHiveModel>('tasks');
    ListTaskHiveModel? listTasks = ListTaskHiveModel();
    listTasks.tasks = _tasks;
    log('NEW LIST: ${listTasks.tasks}');
    await hive.put('tasks', listTasks);
    listTasks = hive.get('tasks');
    log('READ LIST: ${listTasks?.tasks}');
  }

  @override
  read() async {
    var hive = Hive.box<ListTaskHiveModel>('tasks');
    ListTaskHiveModel? listTasks = ListTaskHiveModel();
    try {
      listTasks = hive.get('tasks');
    } catch (e) {
      await create();
      listTasks = hive.get('tasks');
    }
    log('real READ LIST: ${listTasks?.tasks}');
    return listTasks?.tasks;
  }

  @override
  update(String id, Task task) async {
    List<Task>? newTasks = _tasks.toList();
    final index = newTasks.indexWhere((element) => element.id == id);
    newTasks.removeWhere((element) => element.id == id);
    newTasks.insert(index, task);
    _tasks = newTasks.toBuiltList();
    var hive = Hive.box<ListTaskHiveModel>('tasks');
    ListTaskHiveModel listTasks = ListTaskHiveModel();
    listTasks.tasks = _tasks;
    await hive.put('tasks', listTasks);
  }
}
