// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SetUserDetailsUserEvent extends SetUserDetailsUserEvent {
  @override
  final String? name;
  @override
  final String? desc;

  factory _$SetUserDetailsUserEvent(
          [void Function(SetUserDetailsUserEventBuilder)? updates]) =>
      (new SetUserDetailsUserEventBuilder()..update(updates))._build();

  _$SetUserDetailsUserEvent._({this.name, this.desc}) : super._();

  @override
  SetUserDetailsUserEvent rebuild(
          void Function(SetUserDetailsUserEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetUserDetailsUserEventBuilder toBuilder() =>
      new SetUserDetailsUserEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetUserDetailsUserEvent &&
        name == other.name &&
        desc == other.desc;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), desc.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetUserDetailsUserEvent')
          ..add('name', name)
          ..add('desc', desc))
        .toString();
  }
}

class SetUserDetailsUserEventBuilder
    implements
        Builder<SetUserDetailsUserEvent, SetUserDetailsUserEventBuilder> {
  _$SetUserDetailsUserEvent? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _desc;
  String? get desc => _$this._desc;
  set desc(String? desc) => _$this._desc = desc;

  SetUserDetailsUserEventBuilder();

  SetUserDetailsUserEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _desc = $v.desc;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetUserDetailsUserEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetUserDetailsUserEvent;
  }

  @override
  void update(void Function(SetUserDetailsUserEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetUserDetailsUserEvent build() => _build();

  _$SetUserDetailsUserEvent _build() {
    final _$result =
        _$v ?? new _$SetUserDetailsUserEvent._(name: name, desc: desc);
    replace(_$result);
    return _$result;
  }
}

class _$SetUserImageUserEvent extends SetUserImageUserEvent {
  @override
  final String? path;

  factory _$SetUserImageUserEvent(
          [void Function(SetUserImageUserEventBuilder)? updates]) =>
      (new SetUserImageUserEventBuilder()..update(updates))._build();

  _$SetUserImageUserEvent._({this.path}) : super._();

  @override
  SetUserImageUserEvent rebuild(
          void Function(SetUserImageUserEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SetUserImageUserEventBuilder toBuilder() =>
      new SetUserImageUserEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SetUserImageUserEvent && path == other.path;
  }

  @override
  int get hashCode {
    return $jf($jc(0, path.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SetUserImageUserEvent')
          ..add('path', path))
        .toString();
  }
}

class SetUserImageUserEventBuilder
    implements Builder<SetUserImageUserEvent, SetUserImageUserEventBuilder> {
  _$SetUserImageUserEvent? _$v;

  String? _path;
  String? get path => _$this._path;
  set path(String? path) => _$this._path = path;

  SetUserImageUserEventBuilder();

  SetUserImageUserEventBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _path = $v.path;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SetUserImageUserEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SetUserImageUserEvent;
  }

  @override
  void update(void Function(SetUserImageUserEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SetUserImageUserEvent build() => _build();

  _$SetUserImageUserEvent _build() {
    final _$result = _$v ?? new _$SetUserImageUserEvent._(path: path);
    replace(_$result);
    return _$result;
  }
}

class _$ReadUserEvent extends ReadUserEvent {
  factory _$ReadUserEvent([void Function(ReadUserEventBuilder)? updates]) =>
      (new ReadUserEventBuilder()..update(updates))._build();

  _$ReadUserEvent._() : super._();

  @override
  ReadUserEvent rebuild(void Function(ReadUserEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReadUserEventBuilder toBuilder() => new ReadUserEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReadUserEvent;
  }

  @override
  int get hashCode {
    return 572101357;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper(r'ReadUserEvent').toString();
  }
}

class ReadUserEventBuilder
    implements Builder<ReadUserEvent, ReadUserEventBuilder> {
  _$ReadUserEvent? _$v;

  ReadUserEventBuilder();

  @override
  void replace(ReadUserEvent other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReadUserEvent;
  }

  @override
  void update(void Function(ReadUserEventBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReadUserEvent build() => _build();

  _$ReadUserEvent _build() {
    final _$result = _$v ?? new _$ReadUserEvent._();
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
