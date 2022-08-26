import 'package:built_value/built_value.dart';

part 'events.g.dart';

abstract class UserEvent {}

abstract class SetUserDetailsUserEvent extends UserEvent
    implements Built<SetUserDetailsUserEvent, SetUserDetailsUserEventBuilder> {
  String? get name;

  String? get desc;

  SetUserDetailsUserEvent._();
  factory SetUserDetailsUserEvent(
          [void Function(SetUserDetailsUserEventBuilder) updates]) =
      _$SetUserDetailsUserEvent;
}

abstract class SetUserImageUserEvent extends UserEvent
    implements Built<SetUserImageUserEvent, SetUserImageUserEventBuilder> {
  String? get path;

  SetUserImageUserEvent._();
  factory SetUserImageUserEvent(
          [void Function(SetUserImageUserEventBuilder) updates]) =
      _$SetUserImageUserEvent;
}

abstract class ReadUserEvent extends UserEvent
    implements Built<ReadUserEvent, ReadUserEventBuilder> {
  ReadUserEvent._();
  factory ReadUserEvent([void Function(ReadUserEventBuilder) updates]) =
      _$ReadUserEvent;
}
