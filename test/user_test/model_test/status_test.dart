import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/user_domain/model/user_status.dart';

void main() {
  group("User Status test", () {
    test("hash code is not null", () async {
      UserStatus status = UserStatus.idle;
      expect(status.hashCode, isNotNull);
    });
    test("hash code is not null", () async {
      var status = UserStatus.values;
      expect(status, isNotNull);
    });
    test("value of idle is not null", () async {
      var status = UserStatus.valueOf('idle');
      expect(status, isNotNull);
    });
    test("value of loading is not null", () async {
      var status = UserStatus.valueOf('loading');
      expect(status, isNotNull);
    });
    test("value of init is not null", () async {
      var status = UserStatus.valueOf('init');
      expect(status, isNotNull);
    });
    test("value of error is not null", () async {
      var status = UserStatus.valueOf('error');
      expect(status, isNotNull);
    });
    test("value get error", () async {
      ArgumentError? error;
      try {
        var status = UserStatus.valueOf('something');
      } catch (e) {
        error = e as ArgumentError?;
      }
      expect(error.toString(), ArgumentError('something').toString());
    });
  });
}
