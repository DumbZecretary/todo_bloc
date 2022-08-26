import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/todo_domain/models/events.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';
import 'package:todo_app/todo_domain/models/task_status.dart';
import 'package:todo_app/user_domain/model/events.dart';

void main() {
  group("Todo Event test", () {
    // ----------------------------------------------------------------
    ReadAllTaskTodoEvent readAllTaskTodoEvent = ReadAllTaskTodoEvent();
    test("ReadAllTaskTodoEvent", () async {
      var dumbEvent = ReadAllTaskTodoEvent().rebuild((p0) => null);
      expect(dumbEvent, readAllTaskTodoEvent);
      expect(dumbEvent.toString(), readAllTaskTodoEvent.toString());
      expect(dumbEvent.hashCode, readAllTaskTodoEvent.hashCode);
    });
    // ----------------------------------------------------------------
    ReadDoneTaskTodoEvent readDoneTaskTodoEvent = ReadDoneTaskTodoEvent();
    test("ReadDoneTaskTodoEvent", () async {
      var dumbEvent = ReadDoneTaskTodoEvent().rebuild((p0) => null);
      expect(dumbEvent, readDoneTaskTodoEvent);
      expect(dumbEvent.toString(), readDoneTaskTodoEvent.toString());
      expect(dumbEvent.hashCode, readDoneTaskTodoEvent.hashCode);
    });
    // ----------------------------------------------------------------
    ReadPendingTaskTodoEvent readPendingTaskTodoEvent =
        ReadPendingTaskTodoEvent();
    test("ReadPendingTaskTodoEvent", () async {
      var dumbEvent = ReadPendingTaskTodoEvent().rebuild((p0) => null);
      expect(dumbEvent, readPendingTaskTodoEvent);
      expect(dumbEvent.toString(), readPendingTaskTodoEvent.toString());
      expect(dumbEvent.hashCode, readPendingTaskTodoEvent.hashCode);
    });
    // ----------------------------------------------------------------
    ReadProgressTaskTodoEvent readProgressTaskTodoEvent =
        ReadProgressTaskTodoEvent();
    test("ReadProgressTaskTodoEvent", () async {
      var dumbEvent = ReadProgressTaskTodoEvent().rebuild((p0) => null);
      expect(dumbEvent, readProgressTaskTodoEvent);
      expect(dumbEvent.toString(), readProgressTaskTodoEvent.toString());
      expect(dumbEvent.hashCode, readProgressTaskTodoEvent.hashCode);
    });
    // ----------------------------------------------------------------
    SetViewIndexTodoEvent setViewIndexTodoEvent =
        SetViewIndexTodoEvent((b) => b..value = "value");
    test("SetViewIndexTodoEvent", () async {
      var dumbEvent =
          SetViewIndexTodoEvent().rebuild((p0) => p0..value = "value");
      expect(dumbEvent, setViewIndexTodoEvent);
      expect(dumbEvent.toString(), setViewIndexTodoEvent.toString());
      expect(dumbEvent.hashCode, setViewIndexTodoEvent.hashCode);
    });
    // ----------------------------------------------------------------
    InsertTodoEventBuilder insertTodoEventBuilder = InsertTodoEventBuilder();
    InsertTodoEvent insertTodoEvent = InsertTodoEvent();
    insertTodoEvent = InsertTodoEvent(
        (b) => b..task = Task.initial(id: "id", title: "title").toBuilder());
    test("InsertTodoEvent", () async {
      var dumbEvent = InsertTodoEvent().rebuild(
          (b) => b..task = Task.initial(id: "id", title: "title").toBuilder());
      expect(dumbEvent, insertTodoEvent);
      expect(dumbEvent.toString(), insertTodoEvent.toString());
      expect(dumbEvent.hashCode, insertTodoEvent.hashCode);
      expect(dumbEvent.task, insertTodoEvent.task);
      expect(insertTodoEventBuilder.task.toString(), TaskBuilder().toString());
    });
    // ----------------------------------------------------------------
    DeleteTodoEventBuilder deleteTodoEventBuilder = DeleteTodoEventBuilder();
    DeleteTodoEvent deleteTodoEvent = DeleteTodoEvent(
        (b) => b..task = Task.initial(id: "id", title: "title").toBuilder());
    test("InsertTodoEvent", () async {
      var dumbEvent = DeleteTodoEvent().rebuild(
          (b) => b..task = Task.initial(id: "id", title: "title").toBuilder());
      expect(dumbEvent, deleteTodoEvent);
      expect(dumbEvent.toString(), deleteTodoEvent.toString());
      expect(dumbEvent.hashCode, deleteTodoEvent.hashCode);
      expect(deleteTodoEventBuilder.task.toString(),
          DeleteTodoEventBuilder().task.toString());
    });
    // ----------------------------------------------------------------
    UpdateTodoEvent updateTodoEvent =
        UpdateTodoEvent((b) => b..taskStatus = TaskStatus.done);
    test("UpdateTodoEvent", () async {
      var dumbEvent =
          UpdateTodoEvent().rebuild((b) => b..taskStatus = TaskStatus.done);
      expect(dumbEvent, updateTodoEvent);
      expect(dumbEvent.toString(), updateTodoEvent.toString());
      expect(dumbEvent.hashCode, updateTodoEvent.hashCode);
    });
    // ----------------------------------------------------------------
    UpdatePercentsTodoEvent updatePercentsTodoEvent = UpdatePercentsTodoEvent();
    test("ReadProgressTaskTodoEvent", () async {
      var dumbEvent = UpdatePercentsTodoEvent().rebuild((p0) => null);
      expect(dumbEvent, updatePercentsTodoEvent);
      expect(dumbEvent.toString(), updatePercentsTodoEvent.toString());
      expect(dumbEvent.hashCode, updatePercentsTodoEvent.hashCode);
    });
    // ----------------------------------------------------------------
    GetTotalTasksTodoEvent getTotalTasksTodoEvent = GetTotalTasksTodoEvent();
    test("ReadProgressTaskTodoEvent", () async {
      var dumbEvent = GetTotalTasksTodoEvent().rebuild((p0) => null);
      expect(dumbEvent, getTotalTasksTodoEvent);
      expect(dumbEvent.toString(), getTotalTasksTodoEvent.toString());
      expect(dumbEvent.hashCode, getTotalTasksTodoEvent.hashCode);
    });
  });
}
