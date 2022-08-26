import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/user_domain/model/user_state.dart';

void main() {
  group("User State test", () {
    test("hash code is not null", () async {
      UserState state = UserState();
      expect(state.hashCode, isNotNull);
    });
  });
}
