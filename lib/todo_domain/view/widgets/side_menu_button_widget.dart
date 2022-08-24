import 'package:flutter/material.dart';

class SideMenuButtonWidget extends StatelessWidget {
  const SideMenuButtonWidget({
    required this.onPress,
    required this.title,
    this.color,
    Key? key,
  }) : super(key: key);
  final VoidCallback onPress;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.fromLTRB(32, 0, 0, 16),
        height: 60,
        width: 180,
        color: Colors.transparent,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: color ?? Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
