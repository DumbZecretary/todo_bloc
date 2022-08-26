import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/config_domain/app.dart';
import 'package:todo_app/config_domain/observer.dart';
import 'package:todo_app/config_domain/utils/logging.dart';
import 'package:todo_app/todo_domain/models/tasks_hive_model.dart';
import 'package:todo_app/todo_domain/repo/hive_repo.dart';
import 'package:bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final HiveRepo hiveRepo = HiveRepo();
  await Hive.initFlutter();
  Hive.registerAdapter(ListTaskHiveModelAdapter());
  await Hive.openBox<ListTaskHiveModel>('tasks');
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  bootstrap(hiveRepo: hiveRepo, sharedPreferences: sharedPreferences);
}

void bootstrap(
    {required HiveRepo hiveRepo,
    required SharedPreferences sharedPreferences}) {
  DebugLogger debugLogger = DebugLogger();
  FlutterError.onError = (details) {
    debugLogger.log(details.exceptionAsString(), details.stack);
  };

  Bloc.observer = TodoAppObserver();

  runZonedGuarded(
    () => runApp(
      TodoApp(
        hiveRepo: hiveRepo,
        sharedPreferences: sharedPreferences,
      ),
    ),
    (error, stackTrace) => debugLogger.log(error.toString(), stackTrace),
  );
}

// TODO: implement localization
// TODO: unit test for Todo Domain
