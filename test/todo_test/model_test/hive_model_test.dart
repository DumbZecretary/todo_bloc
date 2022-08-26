import 'package:flutter_test/flutter_test.dart';
import 'package:todo_app/todo_domain/models/tasks_hive_model.dart';

void main() {
  group("Todo Hive Model test", () {
    ListTaskHiveModelAdapter listTaskHiveModel = ListTaskHiveModelAdapter();
    test("test 1", () async {
      expect(listTaskHiveModel.hashCode, isNotNull);
    });
    test("test 2", () async {
      expect(listTaskHiveModel, ListTaskHiveModelAdapter());
    });
  });
}
