import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';

class TaskDetailComponent extends StatelessWidget {
  const TaskDetailComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                enabled: false,
                initialValue: "This is initial value",
                decoration: const InputDecoration(
                  labelText: 'Title',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
                minLines: 1,
                maxLines: 10,
                maxLength: 80,
              ),
              TextFormField(
                enabled: false,
                initialValue: "This is initial value",
                decoration: const InputDecoration(
                  labelText: 'Short description',
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
                minLines: 1,
                maxLines: 10,
                maxLength: 160,
              ),
              const SizedBox(
                height: 32,
              ),
              ActionButtonWidget(
                title: "Done",
                color: LightColors.kGreen,
                onPress: () {},
              ),
              const SizedBox(
                height: 32,
              ),
              ActionButtonWidget(
                title: "Delete",
                color: LightColors.kRed,
                onPress: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
