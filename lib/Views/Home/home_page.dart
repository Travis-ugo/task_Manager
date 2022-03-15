import 'package:da_fare/Views/Home/catergories.dart';
import 'package:da_fare/Views/Home/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:da_fare/Views/new_todo.dart';
import 'package:iconly/iconly.dart';

import '../../models/dataBase/database_helperclass.dart';
import '../../models/dataBase/grosary_class.dart';

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
                                title: 'Business',
                              ),
                              SizedBox(width: 15),
                              Categories(
                                lineColor: Colors.pink,
                                task: '15 Tasks',
                                title: 'Personal',
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
                child: FutureBuilder<List<Grosery>>(
                  future: DataBaseHelper.instance.getGrosries(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<Grosery>> snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: Text("Loading"));
                    }
                    return snapshot.data!.isEmpty
                        ? const TaskTile(todoTitle: 'No Task')
                        : Column(
                            children: snapshot.data!.map(
                              (grosery) {
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
                              },
                            ).toList(),
                          );
                  },
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
