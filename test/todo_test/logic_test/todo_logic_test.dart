import 'package:bloc_test/bloc_test.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/config_domain/app_model/app_status.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/todo_domain/models/events.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';
import 'package:todo_app/todo_domain/models/task_status.dart';
import 'package:todo_app/todo_domain/models/todo_state.dart';
import 'package:todo_app/todo_domain/repo/hive_repo.dart';

class MockTodoRepo extends Mock implements HiveRepo {}

void main() {
  // -----------------------------------------------------------------
  group("Todo test read all tasks", () {
    late MockTodoRepo mockTodoRepo = MockTodoRepo();
    var readEvent = ReadAllTaskTodoEvent();
    TodoBloc todoBloc() {
      return TodoBloc(
          initialState: TodoState.initial(
              tasks: BuiltList<Task>([Task.initial(id: "id", title: "title")]),
              locale: 'en',
              status: Status.idle),
          hiveRepo: mockTodoRepo);
    }

    blocTest<TodoBloc, TodoState>("emit new state with all tasks",
        setUp: () {
          when(() => mockTodoRepo.read()).thenAnswer((_) async {
            return BuiltList<Task>([Task.initial(id: "id", title: "title")]);
          });
        },
        build: todoBloc,
        act: (bloc) => bloc.add(readEvent),
        expect: () => [
              TodoState((b) => b
                ..tasks = BuiltList<Task>([]).toBuilder()
                ..status = Status.loading
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
              TodoState((b) => b
                ..tasks =
                    BuiltList<Task>([Task.initial(id: "id", title: "title")])
                        .toBuilder()
                ..status = Status.idle
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
            ],
        verify: (_) {
          verify(() => mockTodoRepo.read()).called(1);
        });
    blocTest<TodoBloc, TodoState>("emit new state with all tasks but error",
        setUp: () {
          when(() => mockTodoRepo.read()).thenThrow(Error());
        },
        build: todoBloc,
        act: (bloc) => bloc.add(readEvent),
        expect: () => [
              TodoState((b) => b
                ..tasks = BuiltList<Task>([]).toBuilder()
                ..status = Status.loading
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
            ],
        verify: (_) {
          verify(() => mockTodoRepo.read()).called(1);
        });
  });
  // -----------------------------------------------------------------
  group("Todo test read done tasks", () {
    late MockTodoRepo mockTodoRepo = MockTodoRepo();
    var readDoneEvent = ReadDoneTaskTodoEvent();
    TodoBloc todoBloc() {
      return TodoBloc(
          initialState: TodoState.initial(
              tasks: BuiltList<Task>([
                Task((b) => b
                  ..id = "id"
                  ..title = "title"
                  ..desc = "desc"
                  ..status = TaskStatus.done)
              ]),
              locale: 'en',
              status: Status.idle),
          hiveRepo: mockTodoRepo);
    }

    blocTest<TodoBloc, TodoState>("emit new state with done tasks",
        setUp: () {
          when(() => mockTodoRepo.read()).thenAnswer((_) async {
            return BuiltList<Task>([
              Task((b) => b
                ..id = "id"
                ..title = "title"
                ..desc = "desc"
                ..status = TaskStatus.done)
            ]);
          });
        },
        build: todoBloc,
        act: (bloc) => bloc.add(readDoneEvent),
        expect: () => [
              TodoState((b) => b
                ..tasks = BuiltList<Task>([]).toBuilder()
                ..status = Status.loading
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
              TodoState((b) => b
                ..tasks = BuiltList<Task>([
                  Task((b) => b
                    ..id = "id"
                    ..title = "title"
                    ..desc = "desc"
                    ..status = TaskStatus.done)
                ]).toBuilder()
                ..status = Status.idle
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
            ],
        verify: (_) {
          verify(() => mockTodoRepo.read()).called(1);
        });
    blocTest<TodoBloc, TodoState>("emit new state with done tasks but error",
        setUp: () {
          when(() => mockTodoRepo.read()).thenThrow(Error());
        },
        build: todoBloc,
        act: (bloc) => bloc.add(readDoneEvent),
        expect: () => [
              TodoState((b) => b
                ..tasks = BuiltList<Task>([]).toBuilder()
                ..status = Status.loading
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
            ],
        verify: (_) {
          verify(() => mockTodoRepo.read()).called(1);
        });
  });
  // -----------------------------------------------------------------
  group("Todo test read pending tasks", () {
    late MockTodoRepo mockTodoRepo = MockTodoRepo();
    var readDoneEvent = ReadPendingTaskTodoEvent();
    TodoBloc todoBloc() {
      return TodoBloc(
          initialState: TodoState.initial(
              tasks: BuiltList<Task>([Task.initial(id: "id", title: "title")]),
              locale: 'en',
              status: Status.idle),
          hiveRepo: mockTodoRepo);
    }

    blocTest<TodoBloc, TodoState>("emit new state with pending tasks",
        setUp: () {
          when(() => mockTodoRepo.read()).thenAnswer((_) async {
            return BuiltList<Task>([Task.initial(id: "id", title: "title")]);
          });
        },
        build: todoBloc,
        act: (bloc) => bloc.add(readDoneEvent),
        expect: () => [
              TodoState((b) => b
                ..tasks = BuiltList<Task>([]).toBuilder()
                ..status = Status.loading
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
              TodoState((b) => b
                ..tasks =
                    BuiltList<Task>([Task.initial(id: "id", title: "title")])
                        .toBuilder()
                ..status = Status.idle
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
            ],
        verify: (_) {
          verify(() => mockTodoRepo.read()).called(1);
        });
    blocTest<TodoBloc, TodoState>("emit new state with pending tasks but error",
        setUp: () {
          when(() => mockTodoRepo.read()).thenThrow(Error());
        },
        build: todoBloc,
        act: (bloc) => bloc.add(readDoneEvent),
        expect: () => [
              TodoState((b) => b
                ..tasks = BuiltList<Task>([]).toBuilder()
                ..status = Status.loading
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
            ],
        verify: (_) {
          verify(() => mockTodoRepo.read()).called(1);
        });
  });
  // -----------------------------------------------------------------
  group("Todo test read in progress tasks", () {
    late MockTodoRepo mockTodoRepo = MockTodoRepo();
    var readInProgressEvent = ReadProgressTaskTodoEvent();
    TodoBloc todoBloc() {
      return TodoBloc(
          initialState: TodoState.initial(
              tasks: BuiltList<Task>([
                Task((b) => b
                  ..id = "id"
                  ..title = "title"
                  ..desc = "desc"
                  ..status = TaskStatus.progress)
              ]),
              locale: 'en',
              status: Status.idle),
          hiveRepo: mockTodoRepo);
    }

    blocTest<TodoBloc, TodoState>("emit new state with in progress tasks",
        setUp: () {
          when(() => mockTodoRepo.read()).thenAnswer((_) async {
            return BuiltList<Task>([
              Task((b) => b
                ..id = "id"
                ..title = "title"
                ..desc = "desc"
                ..status = TaskStatus.progress)
            ]);
          });
        },
        build: todoBloc,
        act: (bloc) => bloc.add(readInProgressEvent),
        expect: () => [
              TodoState((b) => b
                ..tasks = BuiltList<Task>([]).toBuilder()
                ..status = Status.loading
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
              TodoState((b) => b
                ..tasks = BuiltList<Task>([
                  Task((b) => b
                    ..id = "id"
                    ..title = "title"
                    ..desc = "desc"
                    ..status = TaskStatus.progress)
                ]).toBuilder()
                ..status = Status.idle
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
            ],
        verify: (_) {
          verify(() => mockTodoRepo.read()).called(1);
        });
    blocTest<TodoBloc, TodoState>(
        "emit new state with in progress tasks but error",
        setUp: () {
          when(() => mockTodoRepo.read()).thenThrow(Error());
        },
        build: todoBloc,
        act: (bloc) => bloc.add(readInProgressEvent),
        expect: () => [
              TodoState((b) => b
                ..tasks = BuiltList<Task>([]).toBuilder()
                ..status = Status.loading
                ..locale = 'en'
                ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
                ..totalTasks = 0),
            ],
        verify: (_) {
          verify(() => mockTodoRepo.read()).called(1);
        });
  });
  // -----------------------------------------------------------------
  group("Todo test insert tasks", () {
    late MockTodoRepo mockTodoRepo = MockTodoRepo();
    var insertEvent = InsertTodoEvent(
        (b) => b..task = Task.initial(id: "id", title: "title").toBuilder());
    TodoBloc todoBloc() {
      return TodoBloc(
          initialState: TodoState.initial(
              tasks: BuiltList<Task>([]), locale: 'en', status: Status.idle),
          hiveRepo: mockTodoRepo);
    }

    setUp(() {
      registerFallbackValue(Task.initial(id: "id", title: "title"));
    });

    blocTest<TodoBloc, TodoState>(
      "emit new state with new task added",
      setUp: () {
        when(() => mockTodoRepo.insert(any())).thenAnswer((_) async {});
      },
      build: todoBloc,
      act: (bloc) => bloc.add(insertEvent),
      expect: () => [
        TodoState((b) => b
          ..tasks = BuiltList<Task>([]).toBuilder()
          ..status = Status.loading
          ..locale = 'en'
          ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
          ..totalTasks = 0),
      ],
    );
    blocTest<TodoBloc, TodoState>(
      "emit new state with new task added but get error",
      setUp: () {
        when(() => mockTodoRepo.insert(any())).thenThrow(Error());
      },
      build: todoBloc,
      act: (bloc) => bloc.add(insertEvent),
      expect: () => [
        TodoState((b) => b
          ..tasks = BuiltList<Task>([]).toBuilder()
          ..status = Status.loading
          ..locale = 'en'
          ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
          ..totalTasks = 0),
      ],
    );
  });
  // -----------------------------------------------------------------
  group("Todo test set index view", () {
    late MockTodoRepo mockTodoRepo = MockTodoRepo();
    var setIndexViewEvent = SetViewIndexTodoEvent((b) => b..value = "id");
    TodoBloc todoBloc() {
      return TodoBloc(
          initialState: TodoState.initial(
              tasks: BuiltList<Task>([]), locale: 'en', status: Status.idle),
          hiveRepo: mockTodoRepo);
    }

    setUp(() {
      registerFallbackValue(Task.initial(id: "id", title: "title"));
    });

    blocTest<TodoBloc, TodoState>(
      "emit new state with new index added",
      setUp: () {},
      build: todoBloc,
      act: (bloc) => bloc.add(setIndexViewEvent),
      expect: () => [
        TodoState((b) => b
          ..tasks = BuiltList<Task>([]).toBuilder()
          ..status = Status.loading
          ..locale = 'en'
          ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
          ..totalTasks = 0),
        TodoState((b) => b
          ..tasks = BuiltList<Task>([]).toBuilder()
          ..status = Status.idle
          ..viewIndex = "id"
          ..locale = 'en'
          ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
          ..totalTasks = 0),
      ],
    );
    blocTest<TodoBloc, TodoState>(
      "emit new state with new index added but get error",
      setUp: () {
        when(() => mockTodoRepo.read()).thenThrow(Error());
      },
      build: todoBloc,
      act: (bloc) => bloc.add(setIndexViewEvent),
      expect: () => [
        TodoState((b) => b
          ..tasks = BuiltList<Task>([]).toBuilder()
          ..status = Status.loading
          ..locale = 'en'
          ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
          ..totalTasks = 0),
      ],
    );
  });
  // -----------------------------------------------------------------
  group("Todo test delete task", () {
    late MockTodoRepo mockTodoRepo = MockTodoRepo();
    var deleteEvent = DeleteTodoEvent(
        (b) => b..task = Task.initial(id: "id", title: "title").toBuilder());
    TodoBloc todoBloc() {
      return TodoBloc(
          initialState: TodoState.initial(
              tasks: BuiltList<Task>([Task.initial(id: "id", title: "title")]),
              locale: 'en',
              status: Status.idle),
          hiveRepo: mockTodoRepo);
    }

    setUp(() {
      registerFallbackValue(Task.initial(id: "id", title: "title"));
    });

    blocTest<TodoBloc, TodoState>(
      "emit new state after delete task",
      setUp: () {
        when(() => mockTodoRepo.delete("id")).thenAnswer((invocation) async {});
      },
      build: todoBloc,
      act: (bloc) => bloc.add(deleteEvent),
      expect: () => [
        TodoState((b) => b
          ..tasks = BuiltList<Task>([]).toBuilder()
          ..status = Status.loading
          ..locale = 'en'
          ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
          ..totalTasks = 0),
      ],
    );
    blocTest<TodoBloc, TodoState>(
      "emit new state after delete task but error",
      setUp: () {
        when(() => mockTodoRepo.delete("id")).thenThrow(Error());
      },
      build: todoBloc,
      act: (bloc) => bloc.add(deleteEvent),
      expect: () => [
        TodoState((b) => b
          ..tasks = BuiltList<Task>([]).toBuilder()
          ..status = Status.loading
          ..locale = 'en'
          ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
          ..totalTasks = 0),
      ],
    );
  });
  // -----------------------------------------------------------------
  group("Todo test update task", () {
    late MockTodoRepo mockTodoRepo = MockTodoRepo();
    var updateEvent =
        UpdateTodoEvent((b) => b..taskStatus = TaskStatus.progress);
    TodoBloc todoBloc() {
      return TodoBloc(
          initialState: TodoState((b) => b
            ..status = Status.idle
            ..viewIndex = "id"
            ..totalTasks = 1
            ..locale = 'en'
            ..percents = BuiltList<double>([1.0, 1.0, 0.0, 0.0]).toBuilder()
            ..tasks = BuiltList<Task>([
              Task((b) => b
                ..status = TaskStatus.pending
                ..id = "id"
                ..title = "title"
                ..desc = "desc")
            ]).toBuilder()),
          hiveRepo: mockTodoRepo);
    }

    setUp(() {
      registerFallbackValue(Task((b) => b
        ..status = TaskStatus.progress
        ..id = "id"
        ..title = "title"
        ..desc = "desc"));
    });

    blocTest<TodoBloc, TodoState>(
      "emit new state after update task",
      setUp: () {
        when(() => mockTodoRepo.update("id", any()))
            .thenAnswer((invocation) async {});
        when(() => mockTodoRepo.read()).thenAnswer((invocation) async {
          return BuiltList<Task>([
            Task((b) => b
              ..status = TaskStatus.progress
              ..id = "id"
              ..title = "title"
              ..desc = "desc")
          ]);
        });
      },
      build: todoBloc,
      act: (bloc) => bloc.add(updateEvent),
      expect: () => [
        TodoState((b) => b
          ..tasks = BuiltList<Task>([
            Task((b) => b
              ..status = TaskStatus.pending
              ..id = "id"
              ..title = "title"
              ..desc = "desc")
          ]).toBuilder()
          ..status = Status.loading
          ..locale = 'en'
          ..viewIndex = "id"
          ..totalTasks = 1
          ..percents = BuiltList<double>([1.0, 1.0, 0.0, 0.0]).toBuilder()),
      ],
    );
    blocTest<TodoBloc, TodoState>(
      "emit new state after update task but error",
      setUp: () {
        when(() => mockTodoRepo.update("id", any()))
            .thenAnswer((invocation) async {});
        when(() => mockTodoRepo.read()).thenThrow(Error());
      },
      build: todoBloc,
      act: (bloc) => bloc.add(updateEvent),
      expect: () => [
        TodoState((b) => b
          ..tasks = BuiltList<Task>([
            Task((b) => b
              ..status = TaskStatus.pending
              ..id = "id"
              ..title = "title"
              ..desc = "desc")
          ]).toBuilder()
          ..status = Status.loading
          ..locale = 'en'
          ..viewIndex = "id"
          ..totalTasks = 1
          ..percents = BuiltList<double>([1.0, 1.0, 0.0, 0.0]).toBuilder()),
      ],
    );
  });
  // -----------------------------------------------------------------
  group("Todo test update percents", () {
    late MockTodoRepo mockTodoRepo = MockTodoRepo();
    var updateEvent = UpdatePercentsTodoEvent();
    TodoBloc todoBloc() {
      return TodoBloc(
          initialState: TodoState((b) => b
            ..status = Status.idle
            ..percents = BuiltList<double>([1.0, 1.0, 0.0, 0.0]).toBuilder()
            ..tasks = BuiltList<Task>([]).toBuilder()),
          hiveRepo: mockTodoRepo);
    }

    blocTest<TodoBloc, TodoState>(
      "emit new state after update percents",
      setUp: () {
        when(() => mockTodoRepo.read()).thenAnswer((invocation) async {
          return BuiltList<Task>([
            Task((b) => b
              ..status = TaskStatus.progress
              ..id = "id"
              ..title = "title"
              ..desc = "desc"),
            Task((b) => b
              ..status = TaskStatus.pending
              ..id = "id2"
              ..title = "title2"
              ..desc = "desc2"),
            Task((b) => b
              ..status = TaskStatus.done
              ..id = "id3"
              ..title = "title3"
              ..desc = "desc3")
          ]);
        });
      },
      build: todoBloc,
      act: (bloc) => bloc.add(updateEvent),
      expect: () => [
        TodoState((b) => b
          ..tasks = BuiltList<Task>([]).toBuilder()
          ..status = Status.loading
          ..percents = BuiltList<double>([1.0, 1.0, 0.0, 0.0]).toBuilder()),
      ],
    );
    blocTest<TodoBloc, TodoState>(
      "emit new state after update percents but error",
      setUp: () {
        when(() => mockTodoRepo.read()).thenThrow(Error());
      },
      build: todoBloc,
      act: (bloc) => bloc.add(updateEvent),
      expect: () => [
        TodoState((b) => b
          ..tasks = BuiltList<Task>([]).toBuilder()
          ..status = Status.loading
          ..percents = BuiltList<double>([1.0, 1.0, 0.0, 0.0]).toBuilder()),
      ],
    );
  });
}

// TODO: next, open coverage for info
