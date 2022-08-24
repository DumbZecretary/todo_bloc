import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';

class SubHeaderWidget extends StatelessWidget {
  const SubHeaderWidget({required this.title, Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: LightColors.kDarkBlue,
          fontSize: 20.0,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2),
    );
  }
}
