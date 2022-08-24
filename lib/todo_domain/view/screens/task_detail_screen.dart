import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/view/components/components.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      appBar: TodoAppBar(
        title: "Add new task",
        onPress: () {
          Navigator.of(context).pop();
        },
      ),
      body: const TaskDetailComponent(),
    );
  }
}
