import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'app_status.g.dart';

class Status extends EnumClass {
  static const Status idle = _$idle;
  static const Status loading = _$loading;
  static const Status error = _$error;

  const Status._(String name) : super(name);

  static BuiltSet<Status> get values => _$values;
  static Status valueOf(String name) => _$valueOf(name);
}
