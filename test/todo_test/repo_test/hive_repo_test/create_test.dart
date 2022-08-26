import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import 'package:todo_app/todo_domain/models/tasks_hive_model.dart';
import 'package:todo_app/todo_domain/repo/hive_repo.dart';

void main() {
  group("Todo Repo Hive create test", () {
    late HiveRepo hiveRepo;
    setUp(() async {
      await setUpTestHive();
      hiveRepo = HiveRepo();
      Hive.registerAdapter(ListTaskHiveModelAdapter());
      await Hive.openBox<ListTaskHiveModel>('tasks');
    });
    tearDown(() async {
      await tearDownTestHive();
    });
    test("repo todo create", () async {
      var data = await hiveRepo.create();
      expect(data.toString(), isNotNull);
    });
  });
}
