import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/user_domain/logic/user_bloc.dart';
import 'package:todo_app/user_domain/model/user_state.dart';
import 'package:todo_app/user_domain/view/component/edit_detail_user_component.dart';

class UpdateUserDetailComponent extends StatelessWidget {
  const UpdateUserDetailComponent({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          height: height * 0.8,
          decoration: const BoxDecoration(
            color: LightColors.kLightYellow,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const SizedBox(
                      height: 32,
                      width: 32,
                      child: Center(
                        child: Icon(
                          Icons.close,
                          color: LightColors.kRed,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child:
                    BlocBuilder<UserBloc, UserState>(builder: (context, data) {
                  return SingleChildScrollView(
                    child: EditDetailUserComponent(
                      initName: data.name,
                      initDecs: data.decs,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
