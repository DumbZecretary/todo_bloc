import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';
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
                // TODO: dispatch action get list of all tasks
                Navigator.of(context).pushNamed('/list');
              },
            ),
            SideMenuButtonWidget(
              title: "View done tasks",
              onPress: () {
                // TODO: dispatch action get list of done tasks
                Navigator.of(context).pushNamed('/list');
              },
            ),
            SideMenuButtonWidget(
              title: "View in progress tasks",
              onPress: () {
                // TODO: dispatch action get list of in progress tasks
                Navigator.of(context).pushNamed('/list');
              },
            ),
            SideMenuButtonWidget(
              title: "View pending tasks",
              onPress: () {
                // TODO: dispatch action get list of pending tasks
                Navigator.of(context).pushNamed('/list');
              },
            ),
          ],
        ),
      ),
    );
  }
}
