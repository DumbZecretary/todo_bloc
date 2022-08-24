import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/todo_domain/models/events.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';
import 'package:todo_app/todo_domain/models/task_status.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';
import 'package:uuid/uuid.dart';

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
                onPress: () async {
                  var uuid = const Uuid();
                  final String id = uuid.v1();
                  final Task task = Task((b) => b
                    ..id = id
                    ..status = TaskStatus.pending
                    ..title = titleController.text
                    ..desc = descController.text);
                  (context)
                      .read<TodoBloc>()
                      .add(InsertTodoEvent((b) => b..task = task.toBuilder()));
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          content: Text("Add new task successfully"),
                        );
                      });
                  Future.delayed(const Duration(milliseconds: 300));
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
