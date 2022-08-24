import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/todo_domain/models/events.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';

class MainDrawerComponent extends StatelessWidget {
  const MainDrawerComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: LightColors.kLightYellow,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 32,
            ),
            SideMenuButtonWidget(
              title: "Add new task",
              color: LightColors.kBlue,
              onPress: () {
                Navigator.of(context).pushNamed('/add');
              },
            ),
            SideMenuButtonWidget(
              title: "View all tasks",
              onPress: () {
                (context).read<TodoBloc>().add(ReadAllTaskTodoEvent());
                Navigator.of(context).pushNamed('/list');
              },
            ),
            SideMenuButtonWidget(
              title: "View done tasks",
              onPress: () {
                (context).read<TodoBloc>().add(ReadDoneTaskTodoEvent());
                Navigator.of(context).pushNamed('/list');
              },
            ),
            SideMenuButtonWidget(
              title: "View in progress tasks",
              onPress: () {
                (context).read<TodoBloc>().add(ReadProgressTaskTodoEvent());
                Navigator.of(context).pushNamed('/list');
              },
            ),
            SideMenuButtonWidget(
              title: "View pending tasks",
              onPress: () {
                (context).read<TodoBloc>().add(ReadPendingTaskTodoEvent());
                Navigator.of(context).pushNamed('/list');
              },
            ),
          ],
        ),
      ),
    );
  }
}
