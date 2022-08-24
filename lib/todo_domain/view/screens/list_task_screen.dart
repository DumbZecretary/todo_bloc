import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      appBar: TodoAppBar(
        title: "List Tasks",
        onPress: () {
          Navigator.of(context).pop();
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return TaskDetailWidget(
                // title: "This is the title of the Task that we can see normally",
                title:
                    "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww",
                // description: "This is the description of the Task that we can see normally. It will provide all the information which belong to the Task",
                description:
                    "wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww",
                onPress: () {
                  Navigator.pushNamed(context, '/detail');
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
