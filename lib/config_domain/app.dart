import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/config_domain/app_view.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/todo_domain/models/todo_state.dart';
import 'package:todo_app/todo_domain/repo/hive_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/user_domain/logic/user_bloc.dart';
import 'package:todo_app/user_domain/model/user_state.dart';
import 'package:todo_app/user_domain/repo/prefs_repo.dart';

class TodoApp extends StatefulWidget {
  const TodoApp(
      {required this.hiveRepo, required this.sharedPreferences, Key? key})
      : super(key: key);
  final HiveRepo hiveRepo;
  final SharedPreferences sharedPreferences;

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  @override
  void dispose() {
    Hive.box('tasks').close();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HiveRepo>(create: (context) => HiveRepo()),
        RepositoryProvider<UserRepoSharedPreferences>(
            create: (context) => UserRepoSharedPreferences(
                sharedPreferences: widget.sharedPreferences)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TodoBloc(
              hiveRepo: (context).read<HiveRepo>(),
              initialState: TodoState.initial(),
            ),
          ),
          BlocProvider(
            create: (context) => UserBloc(
              initialState: UserState.initial(),
              prefsRepo: (context).read<UserRepoSharedPreferences>(),
            ),
          ),
        ],
        child: const TodoAppView(),
      ),
    );
  }
}
