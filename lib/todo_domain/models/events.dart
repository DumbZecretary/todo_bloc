import 'package:built_value/built_value.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';
import 'package:todo_app/todo_domain/models/task_status.dart';

part 'events.g.dart';

abstract class TodoEvent {}

abstract class ReadAllTaskTodoEvent extends TodoEvent
    implements Built<ReadAllTaskTodoEvent, ReadAllTaskTodoEventBuilder> {
  ReadAllTaskTodoEvent._();
  factory ReadAllTaskTodoEvent(
          [void Function(ReadAllTaskTodoEventBuilder) updates]) =
      _$ReadAllTaskTodoEvent;
}

abstract class ReadDoneTaskTodoEvent extends TodoEvent
    implements Built<ReadDoneTaskTodoEvent, ReadDoneTaskTodoEventBuilder> {
  ReadDoneTaskTodoEvent._();
  factory ReadDoneTaskTodoEvent(
          [void Function(ReadDoneTaskTodoEventBuilder) updates]) =
      _$ReadDoneTaskTodoEvent;
}

abstract class ReadPendingTaskTodoEvent extends TodoEvent
    implements
        Built<ReadPendingTaskTodoEvent, ReadPendingTaskTodoEventBuilder> {
  ReadPendingTaskTodoEvent._();
  factory ReadPendingTaskTodoEvent(
          [void Function(ReadPendingTaskTodoEventBuilder) updates]) =
      _$ReadPendingTaskTodoEvent;
}

abstract class ReadProgressTaskTodoEvent extends TodoEvent
    implements
        Built<ReadProgressTaskTodoEvent, ReadProgressTaskTodoEventBuilder> {
  ReadProgressTaskTodoEvent._();
  factory ReadProgressTaskTodoEvent(
          [void Function(ReadProgressTaskTodoEventBuilder) updates]) =
      _$ReadProgressTaskTodoEvent;
}

abstract class SetViewIndexTodoEvent extends TodoEvent
    implements Built<SetViewIndexTodoEvent, SetViewIndexTodoEventBuilder> {
  String? get value;

  SetViewIndexTodoEvent._();
  factory SetViewIndexTodoEvent(
          [void Function(SetViewIndexTodoEventBuilder) updates]) =
      _$SetViewIndexTodoEvent;
}

abstract class InsertTodoEvent extends TodoEvent
    implements Built<InsertTodoEvent, InsertTodoEventBuilder> {
  Task? get task;

  InsertTodoEvent._();
  factory InsertTodoEvent([void Function(InsertTodoEventBuilder) updates]) =
      _$InsertTodoEvent;
}

abstract class DeleteTodoEvent extends TodoEvent
    implements Built<DeleteTodoEvent, DeleteTodoEventBuilder> {
  Task? get task;

  DeleteTodoEvent._();
  factory DeleteTodoEvent([void Function(DeleteTodoEventBuilder) updates]) =
      _$DeleteTodoEvent;
}

abstract class UpdateTodoEvent extends TodoEvent
    implements Built<UpdateTodoEvent, UpdateTodoEventBuilder> {
  TaskStatus? get taskStatus;

  UpdateTodoEvent._();
  factory UpdateTodoEvent([void Function(UpdateTodoEventBuilder) updates]) =
      _$UpdateTodoEvent;
}

abstract class UpdatePercentsTodoEvent extends TodoEvent
    implements Built<UpdatePercentsTodoEvent, UpdatePercentsTodoEventBuilder> {
  UpdatePercentsTodoEvent._();
  factory UpdatePercentsTodoEvent(
          [void Function(UpdatePercentsTodoEventBuilder) updates]) =
      _$UpdatePercentsTodoEvent;
}

abstract class GetTotalTasksTodoEvent extends TodoEvent
    implements Built<GetTotalTasksTodoEvent, GetTotalTasksTodoEventBuilder> {
  GetTotalTasksTodoEvent._();
  factory GetTotalTasksTodoEvent(
          [void Function(GetTotalTasksTodoEventBuilder) updates]) =
      _$GetTotalTasksTodoEvent;
}
