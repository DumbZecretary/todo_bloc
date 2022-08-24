import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';

class TodoAppBar extends StatelessWidget with PreferredSizeWidget {
  const TodoAppBar({
    required this.onPress,
    required this.title,
    Key? key,
  }) : super(key: key);
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: LightColors.kLightYellow,
      elevation: 0,
      leading: GestureDetector(
        onTap: onPress,
        child: const SizedBox(
          height: 54,
          width: 54,
          child: Center(
            child: Icon(
              Icons.arrow_back_ios_new,
              color: LightColors.kDarkYellow,
              size: 32,
            ),
          ),
        ),
      ),
      title: Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.black54,
          fontSize: 32,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
