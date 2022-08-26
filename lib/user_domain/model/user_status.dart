import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'user_status.g.dart';

class UserStatus extends EnumClass {
  static const UserStatus idle = _$idle;
  static const UserStatus loading = _$loading;
  static const UserStatus error = _$error;
  static const UserStatus init = _$init;

  const UserStatus._(String name) : super(name);

  static BuiltSet<UserStatus> get values => _$values;
  static UserStatus valueOf(String name) => _$valueOf(name);
}
