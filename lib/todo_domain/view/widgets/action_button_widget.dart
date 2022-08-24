import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';

class ActionButtonWidget extends StatelessWidget {
  const ActionButtonWidget({
    required this.title,
    required this.onPress,
    this.color,
    Key? key,
  }) : super(key: key);
  final VoidCallback onPress;
  final Color? color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 50,
        width: 150,
        decoration: BoxDecoration(
          color: color ?? LightColors.kBlue,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w700, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
