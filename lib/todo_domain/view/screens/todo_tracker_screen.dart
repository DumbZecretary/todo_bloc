import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/view/components/components.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';

class TodoTrackerScreen extends StatelessWidget {
  const TodoTrackerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      drawer: const MainDrawerComponent(),
      body: SafeArea(
        child: Column(
          children: const [
            MainHeaderWidget(
              width: double.infinity,
              child: TodoUserDetailsComponent(),
            ),
            Expanded(
              child: TodoTrackerComponent(),
            ),
          ],
        ),
      ),
    );
  }
}
