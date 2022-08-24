import 'package:flutter/material.dart';
import 'package:todo_app/theme/light_colors.dart';
import 'package:todo_app/todo_domain/view/widgets/widgets.dart';

class TodoTrackerComponent extends StatelessWidget {
  const TodoTrackerComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/add');
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: LightColors.kBlue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  "Add new task",
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.white),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SubHeaderWidget(title: 'Tracker'),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    Expanded(
                      child: TrackerCardWidget(
                        cardColor: LightColors.kGreen,
                        loadingPercent: 0.4,
                        title: 'Done',
                        subtitle: '9 tasks',
                        onPress: () {
                          // TODO: dispatch action get list of done tasks
                          Navigator.of(context).pushNamed('/list');
                        },
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: TrackerCardWidget(
                        cardColor: LightColors.kDarkYellow,
                        loadingPercent: 0.22,
                        title: 'In Progress',
                        subtitle: '5 tasks',
                        onPress: () {
                          // TODO: dispatch action get list of in progress tasks
                          Navigator.of(context).pushNamed('/list');
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: TrackerCardWidget(
                        cardColor: LightColors.kRed,
                        loadingPercent: 0.4,
                        title: 'Pending',
                        subtitle: '9 hours progress',
                        onPress: () {
                          // TODO: dispatch action get list of pending tasks
                          Navigator.of(context).pushNamed('/list');
                        },
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: TrackerCardWidget(
                        cardColor: LightColors.kBlue,
                        loadingPercent: 0.6,
                        title: 'All',
                        subtitle: '23 tasks',
                        onPress: () {
                          // TODO: dispatch action get list of all tasks
                          Navigator.of(context).pushNamed('/list');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
