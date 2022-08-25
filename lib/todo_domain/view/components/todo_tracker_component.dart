import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/config_domain/app_model/app_state.dart';
import 'package:todo_app/config_domain/app_model/app_status.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/todo_domain/models/events.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';

class TodoTrackerComponent extends StatelessWidget {
  const TodoTrackerComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<TodoBloc, AppState>(builder: (context, data) {
        if (data.status! == Status.idle) {
          return Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/add');
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    color: LightColors.kBlue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Center(
                    child: Text(
                      "Add new task",
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
                child:
                    BlocBuilder<TodoBloc, AppState>(builder: (context, data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SubHeaderWidget(title: 'Tracker'),
                      const SizedBox(height: 5.0),
                      Row(
                        children: [
                          Expanded(
                            child: TrackerCardWidget(
                              cardColor: LightColors.kGreen,
                              loadingPercent: data.percents![3],
                              title: 'Done',
                              onPress: () {
                                (context)
                                    .read<TodoBloc>()
                                    .add(ReadDoneTaskTodoEvent());
                                Navigator.of(context).pushNamed('/list');
                              },
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: TrackerCardWidget(
                              cardColor: LightColors.kDarkYellow,
                              loadingPercent: data.percents![2],
                              title: 'In Progress',
                              onPress: () {
                                (context)
                                    .read<TodoBloc>()
                                    .add(ReadProgressTaskTodoEvent());
                                Navigator.of(context).pushNamed('/list');
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TrackerCardWidget(
                              cardColor: LightColors.kRed,
                              loadingPercent: data.percents![1],
                              title: 'Pending',
                              onPress: () {
                                (context)
                                    .read<TodoBloc>()
                                    .add(ReadPendingTaskTodoEvent());
                                Navigator.of(context).pushNamed('/list');
                              },
                            ),
                          ),
                          const SizedBox(width: 20.0),
                          Expanded(
                            child: BlocSelector<TodoBloc, AppState, int?>(
                                selector: (state) => state.totalTasks,
                                builder: (context, total) {
                                  return TrackerCardWidget(
                                    cardColor: LightColors.kBlue,
                                    loadingPercent: data.percents![0],
                                    isActiveCircle: false,
                                    title: 'All',
                                    subtitle: total! > 1
                                        ? '$total Tasks'
                                        : "$total Task",
                                    onPress: () {
                                      (context)
                                          .read<TodoBloc>()
                                          .add(ReadAllTaskTodoEvent());
                                      Navigator.of(context).pushNamed('/list');
                                    },
                                  );
                                }),
                          ),
                        ],
                      ),
                    ],
                  );
                }),
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
    );
  }
}
