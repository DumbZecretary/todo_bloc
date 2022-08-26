import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:todo_app/todo_domain/models/todo_state.dart';
import 'package:todo_app/config_domain/app_model/app_status.dart';
import 'package:todo_app/config_domain/utils/logging.dart';
import 'package:todo_app/todo_domain/models/events.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';
import 'package:todo_app/todo_domain/models/task_status.dart';
import 'package:todo_app/todo_domain/repo/hive_repo.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final HiveRepo _hiveRepo;
  TodoBloc({required TodoState initialState, required HiveRepo hiveRepo})
      : _hiveRepo = hiveRepo,
        super(initialState) {
    on<ReadAllTaskTodoEvent>(_onReadAll);
    on<ReadDoneTaskTodoEvent>(_onReadDone);
    on<ReadPendingTaskTodoEvent>(_onReadPending);
    on<ReadProgressTaskTodoEvent>(_onReadProgress);
    on<SetViewIndexTodoEvent>(_onSetIndexView);
    on<UpdateTodoEvent>(_onUpdate);
    on<DeleteTodoEvent>(_onDelete);
    on<InsertTodoEvent>(_onInsert);
    on<UpdatePercentsTodoEvent>(_onUpdatePercents);
    on<GetTotalTasksTodoEvent>(_onGetTotal);
  }

  FutureOr<void> _onInsert(
      InsertTodoEvent event, Emitter<TodoState> emit) async {
    try {
      var loadingTodoState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingTodoState);
      await _hiveRepo.insert(event.task!);
      BuiltList<Task>? newTasks = await _hiveRepo.read();
      final TodoState newTodoState = state.rebuild((p0) => p0
        ..tasks = newTasks?.toBuilder() ?? BuiltList<Task>([]).toBuilder()
        ..status = Status.idle);
      add(UpdatePercentsTodoEvent());
      await Future.delayed(const Duration(seconds: 0));
      emit(newTodoState);
    } catch (e) {
      addError(Exception("get all tasks error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onReadAll(
      ReadAllTaskTodoEvent event, Emitter<TodoState> emit) async {
    try {
      var loadingTodoState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingTodoState);
      BuiltList<Task>? tasks = BuiltList<Task>([]);
      tasks = await _hiveRepo.read();
      final TodoState newTodoState = state.rebuild((p0) => p0
        ..tasks = tasks?.toBuilder() ?? BuiltList<Task>([]).toBuilder()
        ..status = Status.idle);
      emit(newTodoState);
    } catch (e) {
      addError(Exception("get all tasks error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onReadDone(
      ReadDoneTaskTodoEvent event, Emitter<TodoState> emit) async {
    try {
      var loadingTodoState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingTodoState);
      BuiltList<Task>? tasks = await _hiveRepo.read();
      List<Task> doneTasks = [];
      if (tasks != null) {
        for (int i = 0; i < tasks.length; i++) {
          if (tasks[i].status == TaskStatus.done) {
            doneTasks.add(tasks[i]);
          }
        }
      }
      final TodoState newTodoState = state.rebuild((p0) => p0
        ..tasks = doneTasks.build().toBuilder()
        ..status = Status.idle);
      emit(newTodoState);
    } catch (e) {
      addError(Exception("get all done tasks error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onReadPending(
      ReadPendingTaskTodoEvent event, Emitter<TodoState> emit) async {
    try {
      var loadingTodoState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingTodoState);
      BuiltList<Task>? tasks = await _hiveRepo.read();
      List<Task> pendingTasks = [];
      if (tasks != null) {
        for (int i = 0; i < tasks.length; i++) {
          if (tasks[i].status == TaskStatus.pending) {
            pendingTasks.add(tasks[i]);
          }
        }
      }
      final TodoState newTodoState = state.rebuild((p0) => p0
        ..tasks = pendingTasks.build().toBuilder()
        ..status = Status.idle);
      emit(newTodoState);
    } catch (e) {
      addError(Exception("get all pending tasks error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onReadProgress(
      ReadProgressTaskTodoEvent event, Emitter<TodoState> emit) async {
    try {
      var loadingTodoState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingTodoState);
      BuiltList<Task>? tasks = await _hiveRepo.read();
      List<Task> progressTasks = [];
      if (tasks != null) {
        for (int i = 0; i < tasks.length; i++) {
          if (tasks[i].status == TaskStatus.progress) {
            progressTasks.add(tasks[i]);
          }
        }
      }
      final TodoState newTodoState = state.rebuild((p0) => p0
        ..tasks = progressTasks.build().toBuilder()
        ..status = Status.idle);
      emit(newTodoState);
    } catch (e) {
      addError(
          Exception("get all in progress tasks error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onSetIndexView(
      SetViewIndexTodoEvent event, Emitter<TodoState> emit) async {
    try {
      var loadingTodoState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingTodoState);
      await _hiveRepo.read();
      final TodoState newTodoState = state.rebuild((p0) => p0
        ..viewIndex = event.value
        ..status = Status.idle);
      emit(newTodoState);
    } catch (e) {
      addError(Exception("set index view error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onDelete(
      DeleteTodoEvent event, Emitter<TodoState> emit) async {
    try {
      var loadingTodoState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingTodoState);
      await _hiveRepo.delete(event.task!.id!);
      BuiltList<Task>? newTasks = await _hiveRepo.read();
      if (newTasks == null) {
        await _hiveRepo.create();
      }
      final TodoState newTodoState = state.rebuild((p0) => p0
        ..tasks = newTasks?.toBuilder() ?? BuiltList<Task>([]).toBuilder()
        ..status = Status.idle);
      add(UpdatePercentsTodoEvent());
      await Future.delayed(const Duration(seconds: 0));
      emit(newTodoState);
    } catch (e) {
      addError(Exception("delete task error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onUpdate(
      UpdateTodoEvent event, Emitter<TodoState> emit) async {
    try {
      var loadingTodoState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingTodoState);
      Task task = state.tasks!
          .firstWhere((p0) => p0.id == state.viewIndex)
          .rebuild((p0) => p0..status = event.taskStatus);
      await _hiveRepo.update(state.viewIndex!, task);

      BuiltList<Task>? newTasks = await _hiveRepo.read();

      final TodoState newTodoState = state.rebuild((p0) => p0
        ..tasks = newTasks?.toBuilder() ?? BuiltList<Task>([]).toBuilder()
        ..status = Status.idle);
      add(UpdatePercentsTodoEvent());
      await Future.delayed(const Duration(seconds: 0));
      emit(newTodoState);
    } catch (e) {
      addError(Exception("update task error"), StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  //------------------------------------------------

  FutureOr<void> _onUpdatePercents(
      UpdatePercentsTodoEvent event, Emitter<TodoState> emit) async {
    try {
      await _onGetTotal(GetTotalTasksTodoEvent(), emit);
      var loadingTodoState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingTodoState);

      BuiltList<Task>? tasks = await _hiveRepo.read();
      if (tasks == null) {
        await _hiveRepo.create();
      }
      BuiltList<double>? newPercents;
      int countAll = 0;
      int countPending = 0;
      int countInProgress = 0;
      int countDone = 0;
      if (tasks != null) {
        for (int i = 0; i < tasks.length; i++) {
          countAll++;
          switch (tasks[i].status) {
            case TaskStatus.pending:
              countPending++;
              break;
            case TaskStatus.done:
              countDone++;
              break;
            case TaskStatus.progress:
              countInProgress++;
              break;
          }
        }
      }

      double percentPending = roundPercent(countPending, countAll);
      double percentInProgress = roundPercent(countInProgress, countAll);
      double percentDone = roundPercent(countDone, countAll);

      newPercents = BuiltList<double>(
          [1.0, percentPending, percentInProgress, percentDone]);

      final TodoState newTodoState = state.rebuild((p0) => p0
        ..percents = newPercents!.toBuilder()
        ..status = Status.idle);

      emit(newTodoState);
    } catch (e) {
      addError(Exception("update percents of domain todo error"),
          StackTrace.current);
      DebugLogger debugLogger = DebugLogger();
      debugLogger.log('Get error: $e');
    }
  }

  FutureOr<void> _onGetTotal(
      GetTotalTasksTodoEvent event, Emitter<TodoState> emit) async {
    try {
      var loadingTodoState = state.rebuild((p0) => p0..status = Status.loading);
      emit(loadingTodoState);

      int total = 0;

      BuiltList<Task>? tasks = await _hiveRepo.read();
      if (tasks == null) {
        await _hiveRepo.create();
      } else {
        total = tasks.length;
      }

      final TodoState newTodoState = state.rebuild((p0) => p0
        ..totalTasks = total
        ..status = Status.idle);
      await Future.delayed(const Duration(seconds: 0));
      emit(newTodoState);
    } catch (e) {
      addError(Exception("update percents of domain todo error"),
          StackTrace.current);
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

double roundPercent(int value1, int value2) {
  if (value1 != 0 && value2 != 0) {
    final double value = value1 / value2;
    final String inString = value.toStringAsFixed(2);
    final double inDouble = double.parse(inString);
    return inDouble;
  }
  return 0.0;
}
