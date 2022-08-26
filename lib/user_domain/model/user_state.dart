import 'package:built_value/built_value.dart';
import 'package:todo_app/user_domain/model/user_status.dart';

part 'user_state.g.dart';

abstract class UserState implements Built<UserState, UserStateBuilder> {
  String? get name;

  String? get decs;

  String? get path;

  UserStatus? get status;

  UserState._();
  factory UserState([void Function(UserStateBuilder) updates]) = _$UserState;

  factory UserState.initial(
      {String? name, String? decs, String? path, UserStatus? status}) {
    return UserState((b) => b
      ..name = name
      ..decs = decs
      ..path = path
      ..status = status);
  }
}
