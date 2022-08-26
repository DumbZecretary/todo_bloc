import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/todo_domain/models/todo_state.dart';
import 'package:todo_app/config_domain/app_model/app_status.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/todo_domain/view/components/components.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';

class TodoTrackerScreen extends StatelessWidget {
  const TodoTrackerScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TodoBloc, TodoState, Status>(selector: (state) {
      return state.status!;
    }, builder: (context, data) {
      if (data == Status.idle) {
        return Scaffold(
          backgroundColor: LightColors.kLightYellow,
          drawer: const MainDrawerComponent(),
          body: SafeArea(
            child: Column(
              children: const [
                MainHeaderWidget(
                  width: double.infinity,
                  child: UserDetailsComponent(),
                ),
                Expanded(
                  child: TodoTrackerComponent(),
                ),
              ],
            ),
          ),
        );
      } else {
        return const Scaffold(
          backgroundColor: LightColors.kLightYellow,
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
