import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/todo_domain/models/events.dart';
import 'package:todo_app/todo_domain/view/screens/screens.dart';
import 'package:todo_app/user_domain/logic/user_bloc.dart';
import 'package:todo_app/user_domain/model/events.dart';

class TodoAppView extends StatefulWidget {
  const TodoAppView({Key? key}) : super(key: key);

  @override
  State<TodoAppView> createState() => _TodoAppViewState();
}

class _TodoAppViewState extends State<TodoAppView> {
  @override
  void initState() {
    (context).read<TodoBloc>().add(ReadAllTaskTodoEvent());
    (context).read<UserBloc>().add(ReadUserEvent());
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
