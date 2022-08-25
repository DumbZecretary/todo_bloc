import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/config_domain/app_model/app_state.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/todo_domain/models/events.dart';
import 'package:todo_app/todo_domain/repo/hive_repo.dart';
import 'package:todo_app/todo_domain/view/screens/screens.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({required this.hiveRepo, Key? key}) : super(key: key);
  final HiveRepo hiveRepo;

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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => TodoBloc(
              hiveRepo: (context).read<HiveRepo>(),
              initialState: AppState.initial(),
            ),
          ),
        ],
        child: const TodoAppView(),
      ),
    );
  }
}

class TodoAppView extends StatefulWidget {
  const TodoAppView({Key? key}) : super(key: key);

  @override
  State<TodoAppView> createState() => _TodoAppViewState();
}

class _TodoAppViewState extends State<TodoAppView> {
  @override
  void initState() {
    // TODO: get shared_preferences data from local - domain user
    (context).read<TodoBloc>().add(ReadAllTaskTodoEvent());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    (context).read<TodoBloc>().add(UpdatePercentsTodoEvent());
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
