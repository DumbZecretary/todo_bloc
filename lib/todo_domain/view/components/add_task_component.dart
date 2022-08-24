import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';

class AddTaskComponent extends StatefulWidget {
  const AddTaskComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTaskComponent> createState() => _AddTaskComponentState();
}

class _AddTaskComponentState extends State<AddTaskComponent> {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SubHeaderWidget(title: 'Title'),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Insert the title of the task here',
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
                controller: titleController,
                minLines: 1,
                maxLines: 10,
                maxLength: 80,
              ),
              const SizedBox(
                height: 16,
              ),
              const SubHeaderWidget(title: 'Short description'),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Insert the short description of the task here",
                  hintStyle: TextStyle(
                    color: Colors.black54,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 16,
                ),
                controller: descController,
                minLines: 1,
                maxLines: 10,
                maxLength: 160,
              ),
              const SizedBox(
                height: 32,
              ),
              ActionButtonWidget(
                title: "Add new task",
                color: LightColors.kBlue,
                onPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content:
                              Text(titleController.text + descController.text),
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
