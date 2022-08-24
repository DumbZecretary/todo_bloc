import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:todo_app/config_domain/app_model/app_state.dart';
import 'package:todo_app/config_domain/app_model/app_status.dart';
import 'package:todo_app/config_domain/utils/logging.dart';
import 'package:todo_app/todo_domain/models/events.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';
import 'package:todo_app/todo_domain/models/task_status.dart';
import 'package:todo_app/todo_domain/repo/hive_repo.dart';
import 'dart:developer';

class TodoBloc extends Bloc<TodoEvent, AppState> {
  final HiveRepo _hiveRepo;
  TodoBloc({required AppState initialState, required HiveRepo hiveRepo})
      : _hiveRepo = hiveRepo,
        super(initialState) {
    on<ReadAllTaskTodoEvent>(_onReadAll);
    on<ReadDoneTaskTodoEvent>(_onReadDone);
    on<ReadPendingTaskTodoEvent>(_onReadPending);
    on<ReadProgressTaskTodoEvent>(_onReadProgress);
    on<SetViewIndexTodoEvent>(_onSetIndexView);
    on<UpdateTodoEvent>(_onUpdate);
    on<DeleteTodoEvent>(_onDelete);
  }

  FutureOr<void> _onReadAll(
      ReadAllTaskTodoEvent event, Emitter<AppState> emit) async {
    try {
      var loadingAppState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingAppState);
      await Future.delayed(const Duration(milliseconds: 300));
      BuiltList<Task>? tasks = _hiveRepo.read();
      final AppState newAppState = state.rebuild((p0) => p0
        ..tasks = tasks?.toBuilder() ?? BuiltList<Task>([]).toBuilder()
        ..status = Status.idle);
      emit(newAppState);
    } catch (e) {
      addError(Exception("get all tasks error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onReadDone(
      ReadDoneTaskTodoEvent event, Emitter<AppState> emit) async {
    try {
      var loadingAppState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingAppState);
      BuiltList<Task>? tasks = _hiveRepo.read();
      List<Task> doneTasks = [];
      if (tasks != null) {
        for (int i = 0; i < tasks.length; i++) {
          if (tasks[i].status == TaskStatus.done) {
            doneTasks.add(tasks[i]);
          }
        }
      }
      final AppState newAppState = state.rebuild((p0) => p0
        ..tasks = doneTasks.build().toBuilder()
        // ?? BuiltList<Task>([]).toBuilder()
        ..status = Status.idle);
      await Future.delayed(const Duration(milliseconds: 300));
      emit(newAppState);
    } catch (e) {
      addError(Exception("get all done tasks error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onReadPending(
      ReadPendingTaskTodoEvent event, Emitter<AppState> emit) async {
    try {
      var loadingAppState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingAppState);
      BuiltList<Task>? tasks = _hiveRepo.read();
      List<Task> pendingTasks = [];
      if (tasks != null) {
        for (int i = 0; i < tasks.length; i++) {
          if (tasks[i].status == TaskStatus.pending) {
            pendingTasks.add(tasks[i]);
          }
        }
      }
      final AppState newAppState = state.rebuild((p0) => p0
        ..tasks = pendingTasks.build().toBuilder()
        // ?? BuiltList<Task>([]).toBuilder()
        ..status = Status.idle);
      await Future.delayed(const Duration(milliseconds: 300));
      emit(newAppState);
    } catch (e) {
      addError(Exception("get all pending tasks error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onReadProgress(
      ReadProgressTaskTodoEvent event, Emitter<AppState> emit) async {
    try {
      var loadingAppState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingAppState);
      BuiltList<Task>? tasks = _hiveRepo.read();
      List<Task> progressTasks = [];
      if (tasks != null) {
        for (int i = 0; i < tasks.length; i++) {
          if (tasks[i].status == TaskStatus.progress) {
            progressTasks.add(tasks[i]);
          }
        }
      }
      final AppState newAppState = state.rebuild((p0) => p0
        ..tasks = progressTasks.build().toBuilder()
        // ?? BuiltList<Task>([]).toBuilder()
        ..status = Status.idle);
      await Future.delayed(const Duration(milliseconds: 300));
      emit(newAppState);
    } catch (e) {
      addError(
          Exception("get all in progress tasks error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onSetIndexView(
      SetViewIndexTodoEvent event, Emitter<AppState> emit) async {
    try {
      var loadingAppState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingAppState);
      final AppState newAppState = state.rebuild((p0) => p0
        ..viewIndex = event.value
        ..status = Status.idle);
      emit(newAppState);
    } catch (e) {
      addError(Exception("set index view error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onDelete(
      DeleteTodoEvent event, Emitter<AppState> emit) async {
    try {
      var loadingAppState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingAppState);
      _hiveRepo.delete(event.task!.id!);
      var newTasks = _hiveRepo.read();
      final AppState newAppState = state.rebuild((p0) => p0
        ..tasks = newTasks?.toBuilder() ?? BuiltList<Task>([]).toBuilder()
        ..status = Status.idle);
      log("length = ${newTasks.length}");
      emit(newAppState);
    } catch (e) {
      addError(Exception("delete task error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onUpdate(
      UpdateTodoEvent event, Emitter<AppState> emit) async {
    try {
      var loadingAppState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingAppState);

      Task task = state.tasks!
          .firstWhere((p0) => p0.id == state.viewIndex)
          .rebuild((p0) => p0..status = event.taskStatus);
      log("EVENT Status: ${event.taskStatus}");
      log("UPDATE: $task");
      _hiveRepo.update(state.viewIndex!, task);

      var newTasks = _hiveRepo.read();
      final AppState newAppState = state.rebuild((p0) => p0
        ..tasks = newTasks?.toBuilder() ?? BuiltList<Task>([]).toBuilder()
        ..status = Status.idle);
      log("length = ${newTasks.length}");
      emit(newAppState);
    } catch (e) {
      addError(Exception("update task error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    DebugLogger debugLogger = DebugLogger();
    debugLogger.log('$error, $stackTrace');
    super.onError(error, stackTrace);
  }
}
