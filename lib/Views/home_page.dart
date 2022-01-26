import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:da_fare/DataBase/database_helperclass.dart';
import 'package:da_fare/DataBase/grosary_class.dart';
import 'package:da_fare/Views/new_todo.dart';

class HomePage extends StatefulWidget {
  final Function()? onTaped;
  const HomePage({
    Key? key,
    this.onTaped,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController categories = ScrollController();
  int? selectedId;
  final textController = TextEditingController();
  final GlobalKey<AnimatedListState> key = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: Stack(
        children: [
          CustomScrollView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: widget.onTaped,
                      child: const Icon(
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
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    const Text(
                      "What's up, Joy!",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'categories',
                      style:
                      TextStyle(fontSize: 14, color: Colors.grey.shade600),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 135,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        controller: categories,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: const [
                              Categories(
                                lineColor: Colors.blue,
                                task: '40 Tasks',
                                titile: 'Business',
                              ),
                              SizedBox(width: 15),
                              Categories(
                                lineColor: Colors.pink,
                                task: '15 Tasks',
                                titile: 'Personal',
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text(
                    'Todays Task',
                    style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: FutureBuilder<List<Grosery>>(
                    future: DataBaseHelper.instance.getGrosries(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Grosery>> snapshot) {
                      if (!snapshot.hasData) {
                        return const Center(child: Text("Loading"));
                      }
                      return snapshot.data!.isEmpty
                          ? const TaskTile(todoTitle: 'No Task')
                          : ListView(
                        children: snapshot.data!.map((grosery) {
                          return TaskTile(
                            todoTitle: grosery.name,
                            onTap: () {
                              textController.text = grosery.name;
                              selectedId = grosery.id;
                            },
                            onLongPress: () async {
                              DataBaseHelper.instance.remove(grosery.id!);
                              setState(() {});
                            },
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 30,
            right: 0,
            child: FloatingActionButton(
              splashColor: Colors.purple,
              elevation: 10,
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewTask(
                      selectedId: selectedId,
                      textController: textController,
                    ),
                  ),
                );
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}

class Categories extends StatelessWidget {
  final String task;
  final String titile;
  final Color lineColor;
  const Categories({
    Key? key,
    required this.task,
    required this.titile,
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
                titile,
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

// class Building extends StatelessWidget {
//   final TextEditingController textController;
//   final int? selectedId;
//   final Function()? setState;
//   const Building({
//     Key? key,
//     required this.textController,
//     required this.selectedId,
//     required this.setState,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Grosery>>(
//       future: DataBaseHelper.instance.getGrosries(),
//       builder: (BuildContext context, AsyncSnapshot<List<Grosery>> snapshot) {
//         if (!snapshot.hasData) {
//           return const Center(child: Text("Loading"));
//         }
//         return snapshot.data!.isEmpty
//             ? const Center(
//                 child: Text("No Data found"),
//               )
//             : ListView.builder(
//                 itemCount: snapshot.data!.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return TaskTile(
//                     todoTitle: snapshot.data![index].name,
//                     onTap: () {
//                       textController.text = snapshot.data![index].name;
//                       // selectedId = snapshot.data![index].id;
//                     },
//                     onLongPress: () {
//                       // DataBaseHelper.instance.remove(snapshot.data![index].id);
//                       setState;
//                       //setState(() {});
//                     },
//                   );
//                 },
//               );
//       },
//     );
//   }
// }

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
