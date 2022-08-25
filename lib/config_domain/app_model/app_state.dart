import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:todo_app/config_domain/app_model/app_status.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  BuiltList<Task>? get tasks;

  String? get locale;

  Status? get status;

  String? get viewIndex;

  BuiltList<double>? get percents;

  AppState._();
  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  factory AppState.initial(
      {BuiltList<Task>? tasks, String? locale, Status? status}) {
    return AppState((b) => b
      ..tasks = BuiltList<Task>([]).toBuilder()
      ..locale = 'en'
      ..percents = BuiltList<double>([0.0, 0.0, 0.0, 0.0]).toBuilder()
      ..status = Status.idle);
  }
}
