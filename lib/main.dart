import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/view/screens/screens.dart';

void main() {
  runApp(
    const TodoApp(),
  );
}

class TodoApp extends StatelessWidget {
  const TodoApp({Key? key}) : super(key: key);

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
