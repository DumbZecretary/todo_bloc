import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/user_domain/model/events.dart';

void main() {
  group("User Event test", () {
    SetUserDetailsUserEvent setUserDetailsUserEvent = SetUserDetailsUserEvent();
    SetUserImageUserEvent setUserImageUserEvent = SetUserImageUserEvent();
    ReadUserEvent readUserEvent = ReadUserEvent();
    test("SetUserDetailsUserEvent", () async {
      var dumbEvent = setUserDetailsUserEvent.rebuild((p0) => p0
        ..name = "name"
        ..desc = "desc");
      expect(
          dumbEvent,
          SetUserDetailsUserEvent((b) => b
            ..name = "name"
            ..desc = "desc"));
      expect(
          dumbEvent.toString(),
          SetUserDetailsUserEvent((b) => b
            ..name = "name"
            ..desc = "desc").toString());
      expect(
          dumbEvent.hashCode,
          SetUserDetailsUserEvent((b) => b
            ..name = "name"
            ..desc = "desc").hashCode);
    });
    test("SetUserImageUserEvent", () async {
      var dumbEvent = setUserImageUserEvent.rebuild((p0) => p0..path = "/path");
      expect(dumbEvent, SetUserImageUserEvent((b) => b..path = "/path"));
      expect(dumbEvent.toString(),
          SetUserImageUserEvent((b) => b..path = "/path").toString());
      expect(dumbEvent.hashCode,
          SetUserImageUserEvent((b) => b..path = "/path").hashCode);
    });
    test("ReadUserEvent", () async {
      var dumbEvent = readUserEvent.rebuild((p0) => null);
      expect(dumbEvent, ReadUserEvent());
      expect(dumbEvent.toString(), ReadUserEvent().toString());
      expect(dumbEvent.hashCode, ReadUserEvent().hashCode);
    });
  });
}
