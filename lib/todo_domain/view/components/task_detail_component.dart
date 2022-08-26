import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/todo_domain/models/todo_state.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/todo_domain/models/events.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';
import 'package:todo_app/todo_domain/models/task_status.dart';
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
          child: BlocSelector<TodoBloc, TodoState, String>(
              selector: (state) => state.viewIndex ?? "",
              builder: (context, data) {
                if (data.isNotEmpty) {
                  return BlocSelector<TodoBloc, TodoState, Task>(
                      selector: (state) => state.tasks!.where((p0) {
                            return p0.id == state.viewIndex;
                          }).first,
                      builder: (context, task) {
                        return Column(
                          children: [
                            TextFormField(
                              enabled: false,
                              initialValue: task.title,
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
                              initialValue: task.desc,
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
                            getUpdateButton(context, task.status!),
                            const SizedBox(
                              height: 32,
                            ),
                            ActionButtonWidget(
                              title: "Delete",
                              color: LightColors.kRed,
                              onPress: () {
                                (context).read<TodoBloc>().add(DeleteTodoEvent(
                                    (b) => b..task = task.toBuilder()));
                                Navigator.of(context)
                                    .popUntil(ModalRoute.withName('/'));
                              },
                            ),
                          ],
                        );
                      });
                } else {
                  return const SizedBox.shrink();
                }
              }),
        ),
      ),
    );
  }
}

Widget getUpdateButton(BuildContext context, TaskStatus taskStatus) {
  switch (taskStatus) {
    case TaskStatus.progress:
      return ActionButtonWidget(
        title: "Done",
        color: LightColors.kGreen,
        onPress: () {
          (context)
              .read<TodoBloc>()
              .add(UpdateTodoEvent((b) => b..taskStatus = TaskStatus.done));
          Navigator.of(context).popUntil(ModalRoute.withName('/'));
        },
      );
    case TaskStatus.pending:
      return ActionButtonWidget(
        title: "In progress",
        color: LightColors.kDarkYellow,
        onPress: () {
          (context)
              .read<TodoBloc>()
              .add(UpdateTodoEvent((b) => b..taskStatus = TaskStatus.progress));
          Navigator.of(context).popUntil(ModalRoute.withName('/'));
        },
      );
    default:
      return const SizedBox.shrink();
  }
}
