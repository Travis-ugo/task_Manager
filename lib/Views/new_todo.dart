import 'package:da_fare/DataBase/database_helperclass.dart';
import 'package:da_fare/DataBase/grosary_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:iconly/iconly.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController taskontroller = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                elevation: 0,
                toolbarHeight: 50,
                actions: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: Colors.blueGrey.shade100, width: 1.5),
                    ),
                    child:
                        const Icon(CupertinoIcons.xmark, color: Colors.black),
                  ),
                ],
              ),
              // const Spacer(),
              TextFormField(
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                controller: taskontroller,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: "Enter New Task",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.blueGrey.shade400,
                  ),
                  focusColor: Colors.blue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 80.0),
                child: Row(
                  children: [
                    Container(
                      height: 65,
                      width: 150,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.5),
                        border: Border.all(
                            color: Colors.blueGrey.shade100, width: 2),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            IconlyLight.calendar,
                            color: Colors.blueGrey.shade400,
                          ),
                          Text(
                            'Today',
                            style: TextStyle(
                              color: Colors.blueGrey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      height: 65,
                      width: 65,
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.5),
                        border: Border.all(
                            color: Colors.blueGrey.shade100, width: 2),
                      ),
                      child: Container(
                        height: 35,
                        width: 35,
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.5),
                          border: Border.all(color: Colors.blue, width: 2.5),
                        ),
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(12.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.folder,
                    size: 25,
                    color: Colors.blueGrey.shade400,
                  ),
                  const SizedBox(width: 20),
                  Icon(
                    CupertinoIcons.flag,
                    size: 25,
                    color: Colors.blueGrey.shade400,
                  ),
                  const SizedBox(width: 20),
                  Icon(
                    FeatherIcons.moon,
                    size: 25,
                    color: Colors.blueGrey.shade400,
                  ),
                ],
              ),
              // const Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 65,
                  width: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.5),
                    color: Colors.blueAccent,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'New Task',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 15),
                      Icon(
                        CupertinoIcons.chevron_up,
                        size: 15,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  int? selectedId;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // if (selectedId != null) {
          //   await DataBaseHelper.instance.upDate(Grosery(
          //     name: textController.text,
          //     id: selectedId,
          //   ));
          // } else if (selectedId == null && textController.text == '') {
          //   await DataBaseHelper.instance.add(
          //     Grosery(name: textController.text),
          //   );
          // }

          selectedId != null
              ? await DataBaseHelper.instance.upDate(Grosery(
                  name: textController.text,
                  id: selectedId,
                ))
              : await DataBaseHelper.instance.add(
                  Grosery(name: textController.text),
                );
          setState(() {
            textController.clear();
            selectedId = null;
            print("PressedButton");
          });
        },
        child: const Icon(
          IconlyLight.plus,
        ),
      ),
      appBar: AppBar(
          title: TextField(
        controller: textController,
      )),
      body: FutureBuilder<List<Grosery>>(
        future: DataBaseHelper.instance.getGrosries(),
        builder: (BuildContext context, AsyncSnapshot<List<Grosery>> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text("Loading"));
          }
          return snapshot.data!.isEmpty
              ? const Center(
                  child: Text("No Data found"),
                )
              : ListView(
                  children: snapshot.data!.map(
                    (grosery) {
                      return Center(
                        child: ListTile(
                          title: Text(grosery.name),
                          onTap: () {
                            textController.text = grosery.name;
                            selectedId = grosery.id;
                          },
                          onLongPress: () async {
                            DataBaseHelper.instance.remove(grosery.id!);
                            setState(() {});
                          },
                        ),
                      );
                    },
                  ).toList(),
                );
        },
      ),
    );
  }
}
