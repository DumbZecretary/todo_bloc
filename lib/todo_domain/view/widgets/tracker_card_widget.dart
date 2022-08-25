import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class TrackerCardWidget extends StatelessWidget {
  final Color cardColor;
  final double loadingPercent;
  final String title;
  final String? subtitle;
  final VoidCallback onPress;
  final bool? isActiveCircle;

  const TrackerCardWidget({
    required this.cardColor,
    required this.loadingPercent,
    required this.title,
    this.isActiveCircle = true,
    this.subtitle,
    required this.onPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: isActiveCircle!
                      ? CircularPercentIndicator(
                          animation: true,
                          radius: 36.0,
                          percent: loadingPercent,
                          lineWidth: 5.0,
                          circularStrokeCap: CircularStrokeCap.round,
                          backgroundColor: Colors.white10,
                          progressColor: Colors.white,
                          center: Text(
                            '${(loadingPercent * 100).round()}%',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        )
                      : const SizedBox(
                          height: 36,
                        ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      subtitle ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white54,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    isActiveCircle!
                        ? const SizedBox.shrink()
                        : const SizedBox(
                            height: 36,
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
