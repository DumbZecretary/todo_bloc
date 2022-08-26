import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_app/todo_domain/models/todo_state.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/logic/todo_bloc.dart';
import 'package:todo_app/user_domain/logic/user_bloc.dart';
import 'package:todo_app/user_domain/model/user_state.dart';
import 'dart:io';

import 'package:todo_app/user_domain/view/component/update_user_detail_component.dart';

class UserDetailsComponent extends StatelessWidget {
  const UserDetailsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(Icons.menu,
                  color: LightColors.kDarkBlue, size: 30.0),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 0.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    BlocSelector<TodoBloc, TodoState, double>(
                        selector: (state) => state.percents![3],
                        builder: (context, data) {
                          return CircularPercentIndicator(
                            radius: 36.0,
                            lineWidth: 5.0,
                            animation: true,
                            percent: data, // percent of done tasks / all tasks
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: LightColors.kRed,
                            backgroundColor: LightColors.kDarkYellow,
                            center: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (context) =>
                                      UpdateUserDetailComponent(height: height),
                                );
                              },
                              child: BlocSelector<UserBloc, UserState, String?>(
                                  selector: (state) => state.path,
                                  builder: (context, data) {
                                    if (data == null || data.isEmpty) {
                                      return const CircleAvatar(
                                        backgroundColor: LightColors.kBlue,
                                        radius: 24.0,
                                        backgroundImage: AssetImage(
                                          'assets/images/avatar.png',
                                        ),
                                      );
                                    } else {
                                      return CircleAvatar(
                                        backgroundColor: LightColors.kBlue,
                                        radius: 24.0,
                                        backgroundImage:
                                            Image.file(File(data)).image,
                                      );
                                    }
                                  }),
                            ),
                          );
                        }),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                              minWidth: 50,
                            ),
                            child: BlocSelector<UserBloc, UserState, String>(
                                selector: (state) => state.name ?? "",
                                builder: (context, data) {
                                  if (data.isEmpty) {
                                    return const Text(
                                      "User's name",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        color: LightColors.kDarkBlue,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      data,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 22.0,
                                        color: LightColors.kDarkBlue,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    );
                                  }
                                }),
                          ),
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                              minWidth: 50,
                            ),
                            child: BlocSelector<UserBloc, UserState, String>(
                                selector: (state) => state.decs ?? "",
                                builder: (context, data) {
                                  if (data.isEmpty) {
                                    return const Text(
                                      "User's short description",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                  } else {
                                    return Text(
                                      data,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    );
                                  }
                                }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
