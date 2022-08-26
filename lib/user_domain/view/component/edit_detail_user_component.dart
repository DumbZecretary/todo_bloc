import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';
import 'package:todo_app/user_domain/logic/user_bloc.dart';
import 'package:todo_app/user_domain/model/events.dart';

class EditDetailUserComponent extends StatefulWidget {
  const EditDetailUserComponent({
    required this.initName,
    required this.initDecs,
    Key? key,
  }) : super(key: key);

  final String? initName;
  final String? initDecs;

  @override
  State<EditDetailUserComponent> createState() =>
      _EditDetailUserComponentState();
}

class _EditDetailUserComponentState extends State<EditDetailUserComponent> {
  final nameController = TextEditingController();
  final descController = TextEditingController();

  @override
  void initState() {
    nameController.text = widget.initName ?? "Insert user name here";
    descController.text = widget.initDecs ?? "Insert short description here";
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SubHeaderWidget(title: 'Name'),
        TextFormField(
          controller: nameController,
          decoration: const InputDecoration(
            hintText: 'Insert your name here',
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
          // controller: titleController,
          minLines: 1,
          maxLines: 10,
          maxLength: 80,
        ),
        const SizedBox(
          height: 16,
        ),
        const SubHeaderWidget(title: 'Short description'),
        TextFormField(
          controller: descController,
          decoration: const InputDecoration(
            hintText: "Insert the short description here",
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
          // controller: descController,
          minLines: 1,
          maxLines: 10,
          maxLength: 160,
        ),
        const SizedBox(
          height: 32,
        ),
        ActionButtonWidget(
            title: "Change avatar",
            color: Colors.deepPurpleAccent,
            onPress: () async {
              await pickImage().then((value) {
                (context).read<UserBloc>().add(
                      SetUserImageUserEvent((b) => b..path = value),
                    );
              });
            }),
        const SizedBox(
          height: 32,
        ),
        ActionButtonWidget(
          title: "Update",
          color: LightColors.kBlue,
          onPress: () async {
            (context).read<UserBloc>().add(
                  SetUserDetailsUserEvent((b) => b
                    ..name = nameController.text
                    ..desc = descController.text),
                );

            showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    content: Text(
                      "Setting user's details successfully",
                      textAlign: TextAlign.center,
                    ),
                  );
                });
            await Future.delayed(const Duration(milliseconds: 600))
                .then((value) {
              Navigator.of(context).popUntil(ModalRoute.withName('/'));
            });
          },
        ),
      ],
    );
  }
}

Future pickImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    } else {
      log("Path is: ${image.path}");
      return image.path;
    }
  } catch (e) {
    log("ERROR when picking image: $e");
  }
}
