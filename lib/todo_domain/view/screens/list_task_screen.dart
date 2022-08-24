import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/config_domain/app_model/app_state.dart';
import 'package:todo_app/config_domain/app_model/app_status.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/todo_domain/models/events.dart';
import 'package:todo_app/todo_domain/models/task_model.dart';
import 'package:todo_app/todo_domain/models/task_status.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';

class ListTaskScreen extends StatelessWidget {
  const ListTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoBloc, AppState, Status>(
        selector: (state) => state.status!,
        builder: (context, data) {
          if (data == Status.idle) {
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
                  child: BlocSelector<TodoBloc, AppState, BuiltList<Task>?>(
                      selector: (state) => state.tasks,
                      builder: (context, data) {
                        if (data == null) {
                          return const SizedBox.shrink();
                        } else {
                          return ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return TaskDetailWidget(
                                title: data[index].title ?? "",
                                description: data[index].desc ?? "",
                                onPress: () {
                                  (context).read<TodoBloc>().add(
                                      SetViewIndexTodoEvent(
                                          (b) => b..value = data[index].id));
                                  Navigator.pushNamed(context, '/detail');
                                },
                                color: getColor(data[index].status!),
                              );
                            },
                          );
                        }
                      }),
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: LightColors.kRed,
                ),
              ),
            );
          }
        });
  }
}

Color getColor(TaskStatus taskStatus) {
  switch (taskStatus) {
    case TaskStatus.done:
      return LightColors.kGreen;
    case TaskStatus.pending:
      return LightColors.kRed;
    case TaskStatus.progress:
      return LightColors.kDarkYellow;
    default:
      return LightColors.kBlue;
  }
}
