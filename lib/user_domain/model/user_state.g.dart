// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserState extends UserState {
  @override
  final String? name;
  @override
  final String? decs;
  @override
  final String? path;
  @override
  final UserStatus? status;

  factory _$UserState([void Function(UserStateBuilder)? updates]) =>
      (new UserStateBuilder()..update(updates))._build();

  _$UserState._({this.name, this.decs, this.path, this.status}) : super._();

  @override
  UserState rebuild(void Function(UserStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStateBuilder toBuilder() => new UserStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserState &&
        name == other.name &&
        decs == other.decs &&
        path == other.path &&
        status == other.status;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, name.hashCode), decs.hashCode), path.hashCode),
        status.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserState')
          ..add('name', name)
          ..add('decs', decs)
          ..add('path', path)
          ..add('status', status))
        .toString();
  }
}

class UserStateBuilder implements Builder<UserState, UserStateBuilder> {
  _$UserState? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _decs;
  String? get decs => _$this._decs;
  set decs(String? decs) => _$this._decs = decs;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  UserStatus? _status;
  UserStatus? get status => _$this._status;
  set status(UserStatus? status) => _$this._status = status;

  UserStateBuilder();

  UserStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _decs = $v.decs;
      _path = $v.path;
      _status = $v.status;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserState;
  }

  @override
  void update(void Function(UserStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserState build() => _build();

  _$UserState _build() {
    final _$result = _$v ??
        new _$UserState._(name: name, decs: decs, path: path, status: status);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
