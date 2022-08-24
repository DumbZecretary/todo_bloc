import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';

class MainHeaderWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final EdgeInsets? padding;
  const MainHeaderWidget(
      {this.height, this.width, this.child, this.padding, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: const BoxDecoration(
          color: LightColors.kDarkYellow,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40.0),
            bottomLeft: Radius.circular(40.0),
          )),
      height: height ?? 120,
      width: width ?? 100,
      child: child ?? const SizedBox(),
    );
  }
}
