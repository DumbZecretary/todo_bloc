import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_app/config_domain/app.dart';
import 'package:todo_app/config_domain/observer.dart';
import 'package:todo_app/config_domain/utils/logging.dart';
import 'package:todo_app/todo_domain/repo/hive_repo.dart';
import 'package:bloc/bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: instance repo
  final HiveRepo hiveRepo = HiveRepo();
  // final SharedPreferences sharedPreferences =
  //     await SharedPreferences.getInstance();
  // final CountingRepoSharedPreferences countingRepoSharedPreferences =
  // CountingRepoSharedPreferences(sharedPreferences: sharedPreferences);
  // bootstrap(repo: countingRepoSharedPreferences);
  bootstrap(hiveRepo: hiveRepo);
}

void bootstrap({required HiveRepo hiveRepo}) {
  DebugLogger debugLogger = DebugLogger();
  FlutterError.onError = (details) {
    debugLogger.log(details.exceptionAsString(), details.stack);
  };

  Bloc.observer = TodoAppObserver();

  runZonedGuarded(
    // TODO: add repo to TodoApp
    () => runApp(
      TodoApp(
        hiveRepo: hiveRepo,
      ),
    ),
    (error, stackTrace) => debugLogger.log(error.toString(), stackTrace),
  );
}

// TODO: implement localization
// TODO: unit test
