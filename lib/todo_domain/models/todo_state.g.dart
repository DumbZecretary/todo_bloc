// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TodoState extends TodoState {
  @override
  final BuiltList<Task>? tasks;
  @override
  final String? locale;
  @override
  final Status? status;
  @override
  final String? viewIndex;
  @override
  final BuiltList<double>? percents;
  @override
  final int? totalTasks;

  factory _$TodoState([void Function(TodoStateBuilder)? updates]) =>
      (new TodoStateBuilder()..update(updates))._build();

  _$TodoState._(
      {this.tasks,
      this.locale,
      this.status,
      this.viewIndex,
      this.percents,
      this.totalTasks})
      : super._();

  @override
  TodoState rebuild(void Function(TodoStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TodoStateBuilder toBuilder() => new TodoStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TodoState &&
        tasks == other.tasks &&
        locale == other.locale &&
        status == other.status &&
        viewIndex == other.viewIndex &&
        percents == other.percents &&
        totalTasks == other.totalTasks;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, tasks.hashCode), locale.hashCode),
                    status.hashCode),
                viewIndex.hashCode),
            percents.hashCode),
        totalTasks.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TodoState')
          ..add('tasks', tasks)
          ..add('locale', locale)
          ..add('status', status)
          ..add('viewIndex', viewIndex)
          ..add('percents', percents)
          ..add('totalTasks', totalTasks))
        .toString();
  }
}

class TodoStateBuilder implements Builder<TodoState, TodoStateBuilder> {
  _$TodoState? _$v;

  ListBuilder<Task>? _tasks;
  ListBuilder<Task> get tasks => _$this._tasks ??= new ListBuilder<Task>();
  set tasks(ListBuilder<Task>? tasks) => _$this._tasks = tasks;

  String? _locale;
  String? get locale => _$this._locale;
  set locale(String? locale) => _$this._locale = locale;

  Status? _status;
  Status? get status => _$this._status;
  set status(Status? status) => _$this._status = status;

  String? _viewIndex;
  String? get viewIndex => _$this._viewIndex;
  set viewIndex(String? viewIndex) => _$this._viewIndex = viewIndex;

  ListBuilder<double>? _percents;
  ListBuilder<double> get percents =>
      _$this._percents ??= new ListBuilder<double>();
  set percents(ListBuilder<double>? percents) => _$this._percents = percents;

  int? _totalTasks;
  int? get totalTasks => _$this._totalTasks;
  set totalTasks(int? totalTasks) => _$this._totalTasks = totalTasks;

  TodoStateBuilder();

  TodoStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _tasks = $v.tasks?.toBuilder();
      _locale = $v.locale;
      _status = $v.status;
      _viewIndex = $v.viewIndex;
      _percents = $v.percents?.toBuilder();
      _totalTasks = $v.totalTasks;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TodoState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TodoState;
  }

  @override
  void update(void Function(TodoStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TodoState build() => _build();

  _$TodoState _build() {
    _$TodoState _$result;
    try {
      _$result = _$v ??
          new _$TodoState._(
              tasks: _tasks?.build(),
              locale: locale,
              status: status,
              viewIndex: viewIndex,
              percents: _percents?.build(),
              totalTasks: totalTasks);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tasks';
        _tasks?.build();

        _$failedField = 'percents';
        _percents?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'TodoState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
