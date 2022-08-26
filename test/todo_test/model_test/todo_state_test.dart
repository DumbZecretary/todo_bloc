import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/todo_domain/models/todo_state.dart';

void main() {
  group("Todo State Model test", () {
    TodoState todoState = TodoState();
    TodoStateBuilder todoStateBuilder = TodoStateBuilder();
    test("test 1", () async {
      expect(todoState.hashCode, isNotNull);
    });
    test("test 2", () async {
      expect(todoState.tasks, null);
    });
    test("test 3", () async {
      expect(todoState.percents, null);
    });
    test("test 4", () async {
      expect(todoStateBuilder.percents.toString(), isNotNull);
    });
    test("test 5", () async {
      expect(todoStateBuilder.tasks.toString(), isNotNull);
    });
  });
}
