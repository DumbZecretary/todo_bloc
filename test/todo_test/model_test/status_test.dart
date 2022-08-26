import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/config_domain/app_model/app_status.dart';

void main() {
  group("Todo Status test", () {
    test("test 1", () async {
      Status status = Status.idle;
      expect(status.hashCode, isNotNull);
    });
    test("test 2", () async {
      var status = Status.values;
      expect(status, isNotNull);
    });
    test("test 3", () async {
      var status = Status.valueOf('idle');
      expect(status, isNotNull);
    });
    test("test 4", () async {
      var status = Status.valueOf('loading');
      expect(status, isNotNull);
    });
    test("test 5", () async {
      var status = Status.valueOf('error');
      expect(status, isNotNull);
    });
    test("value get error", () async {
      ArgumentError? error;
      try {
        var status = Status.valueOf('something');
      } catch (e) {
        error = e as ArgumentError?;
      }
      expect(error.toString(), ArgumentError('something').toString());
    });
  });
}
