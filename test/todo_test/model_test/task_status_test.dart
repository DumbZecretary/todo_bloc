import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/todo_domain/models/task_status.dart';

void main() {
  group("Todo Task Status test", () {
    test("test 1", () async {
      TaskStatus status = TaskStatus.pending;
      expect(status.hashCode, isNotNull);
    });
    test("test 2", () async {
      var status = TaskStatus.values;
      expect(status, isNotNull);
    });
    test("test 3", () async {
      var status = TaskStatus.valueOf('pending');
      expect(status, isNotNull);
    });
    test("test 4", () async {
      var status = TaskStatus.valueOf('progress');
      expect(status, isNotNull);
    });
    test("test 5", () async {
      var status = TaskStatus.valueOf('done');
      expect(status, isNotNull);
    });
    test("value get error", () async {
      ArgumentError? error;
      try {
        var status = TaskStatus.valueOf('something');
      } catch (e) {
        error = e as ArgumentError?;
      }
      expect(error.toString(), ArgumentError('something').toString());
    });
  });
}
