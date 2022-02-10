import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Categories extends StatelessWidget {
  final String task;
  final String title;
  final Color lineColor;
  const Categories({
    Key? key,
    required this.task,
    required this.title,
    required this.lineColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white70,
          ),
          height: 135,
          width: 220,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task,
                //  snapshot.data!.length.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              LinearPercentIndicator(
                padding: const EdgeInsets.all(0),
                animation: true,
                lineHeight: 5.0,
                animationDuration: 2000,
                percent: 0.9,
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: lineColor,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
