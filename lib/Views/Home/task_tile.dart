import 'dart:math';

import 'package:da_fare/Views/Home/task_ticker.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final Function()? onLongPress;
  final String todoTitle;
  final Function()? onTap;
  const TaskTile({
    Key? key,
    this.onLongPress,
    required this.todoTitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var randomColor = Random();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onLongPress: onLongPress,
        onTap: onTap,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white70,
          ),
          child: Row(
            children: [
              TaskTicker(
                color: Color(randomColor.nextInt(0xFFC77070)),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  todoTitle,
                  overflow: TextOverflow.ellipsis,
                  // style: TextStyle(color: Colors.pink),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
