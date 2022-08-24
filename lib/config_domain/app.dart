import 'package:flutter/material.dart';
import 'package:todo_app/config_domain/app_model/app_state.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/todo_domain/repo/hive_repo.dart';
import 'package:todo_app/todo_domain/view/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({required this.hiveRepo, Key? key}) : super(key: key);
  final HiveRepo hiveRepo;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HiveRepo>(create: (context) => HiveRepo()),
      ],
      child: BlocProvider(
        create: (context) => TodoBloc(
          hiveRepo: (context).read<HiveRepo>(),
          initialState: AppState.initial(),
        ),
        child: const TodoAppView(),
      ),
    );
  }
}

class TodoAppView extends StatelessWidget {
  const TodoAppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Todo App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: Theme.of(context).textTheme.apply(
            bodyColor: LightColors.kDarkBlue,
            displayColor: LightColors.kDarkBlue,
            fontFamily: 'Poppins'),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const TodoTrackerScreen(),
        '/list': (context) => const ListTaskScreen(),
        '/add': (context) => const AddTaskScreen(),
        '/detail': (context) => const TaskDetailScreen(),
      },
    );
  }
}
