import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';

class TaskDetailWidget extends StatelessWidget {
  const TaskDetailWidget(
      {required this.title,
      this.description,
      this.color,
      required this.onPress,
      Key? key})
      : super(key: key);
  final String title;
  final String? description;
  final VoidCallback onPress;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          padding: const EdgeInsets.all(16),
          width: double.infinity,
          decoration: BoxDecoration(
            color: color ?? LightColors.kDarkYellow,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                maxLines: 10,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                description ?? "",
                maxLines: 20,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
