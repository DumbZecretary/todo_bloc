import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo_app/theme/light_colors.dart';

class TodoUserDetailsComponent extends StatelessWidget {
  const TodoUserDetailsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    CircularPercentIndicator(
                      radius: 36.0,
                      lineWidth: 5.0,
                      animation: true,
                      percent: 0.75, // percent of done tasks / all tasks
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: LightColors.kRed,
                      backgroundColor: LightColors.kDarkYellow,
                      center: GestureDetector(
                        onTap: () {
                          // TODO: open pop up and setting name, desc, img
                        },
                        child: const CircleAvatar(
                          backgroundColor: LightColors.kBlue,
                          radius: 24.0,
                          backgroundImage: AssetImage(
                            'assets/images/avatar.png',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // TODO: implement User Name
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                              minWidth: 50,
                            ),
                            child: const Text(
                              'Here is Name',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 22.0,
                                color: LightColors.kDarkBlue,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),

                          // TODO: implement User Short Description
                          Container(
                            constraints: const BoxConstraints(
                              maxWidth: 200,
                              minWidth: 50,
                            ),
                            child: const Text(
                              'App Developer',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black45,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
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
