import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTicker extends StatefulWidget {
  final Color color;
  const TaskTicker({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  _TaskTickerState createState() => _TaskTickerState();
}

class _TaskTickerState extends State<TaskTicker> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: () {
          setState(
            () {
              selected = !selected;
            },
          );
        },
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: selected ? Colors.blueGrey.shade100 : Colors.white70,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 2.0,
              color: selected ? Colors.blueGrey.shade100 : widget.color,
            ),
          ),
          child: selected
              ? const Icon(
                  CupertinoIcons.check_mark,
                  color: Colors.white,
                  size: 15,
                )
              : null,
        ),
      ),
    );
  }
}
