import 'dart:math';

import 'package:da_fare/Views/new_todo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class HomePage extends StatelessWidget {
  final Function()? onTaped;
  const HomePage({
    Key? key,
    this.onTaped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NewTask(),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: onTaped,
                    icon: const Icon(
                      Icons.menu,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(
                        IconlyLight.search,
                        color: Colors.black,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        IconlyLight.notification,
                        color: Colors.black,
                        size: 24,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Whats up, Joy!',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Text(
                'categories',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueGrey.shade100,
                    ),
                    height: 135,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('40 Task'),
                        Text(
                          'Business Task',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        Divider(
                          height: 1,
                          thickness: 1,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text('Todays Task'),
              const SizedBox(height: 30),
              const TaskTile()
            ],
          ),
        ],
      ),
    );
  }
}

class TaskTile extends StatelessWidget {
  const TaskTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blueGrey.shade100,
      ),
      child: Row(
        children: const [
          TaskTicker(),
          SizedBox(width: 10),
          Text('Create a new Template'),
        ],
      ),
    );
  }
}

class TaskTicker extends StatefulWidget {
  const TaskTicker({
    Key? key,
  }) : super(key: key);

  @override
  _TaskTickerState createState() => _TaskTickerState();
}

class _TaskTickerState extends State<TaskTicker> {
  var randomColor = Random();

  bool selected = false;
  Color color = Colors.black;
  Color boxColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: GestureDetector(
        onTap: () {
          setState(
            () {
              selected = !selected;
              if (selected == true) {
                color = Colors.white;
                boxColor = Colors.transparent;
              } else {
                color = Colors.black;
                boxColor = Colors.grey.shade200;
              }
            },
          );
        },
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1.6,
              color: Color(randomColor.nextInt(0xffffffff)),
            ),
          ),
          child: selected
              ? null
              : const Icon(
                  CupertinoIcons.check_mark,
                  color: Colors.white,
                  size: 15,
                ),
        ),
      ),
    );
  }
}
