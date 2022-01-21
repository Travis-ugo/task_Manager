import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:iconly/iconly.dart';

import 'package:da_fare/DataBase/database_helperclass.dart';
import 'package:da_fare/DataBase/grosary_class.dart';

class NewTask extends StatefulWidget {
  final int? selectedId;
  final TextEditingController textController;
  const NewTask({
    Key? key,
    required this.selectedId,
    required this.textController,
  }) : super(key: key);

  @override
  State<NewTask> createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  @override
  Widget build(BuildContext context) {
    // TextEditingController taskontroller = TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xFFfbfbff),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        // color: Colors.orange,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                            color: Colors.blueGrey.shade100, width: 1.0),
                      ),
                      child: Center(
                        child: Icon(
                          CupertinoIcons.xmark,
                          color: Colors.blueGrey.shade300,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 200,
                ),
                TextFormField(
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  controller: widget.textController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    hintText: "Enter new task",
                    hintStyle: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Color(0xFF9898A8),
                    ),
                    focusColor: Colors.blue,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30.0),
                  child: Row(
                    children: [
                      Container(
                        height: 65,
                        width: MediaQuery.of(context).size.width / 2 - 50,
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
                              color: Colors.blueGrey.shade300,
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
                // const SizedBox(height: 70),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Row(
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
                ),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () async {
                      widget.selectedId != null
                          ? await DataBaseHelper.instance.upDate(Grosery(
                              name: widget.textController.text,
                              id: widget.selectedId,
                            ))
                          : await DataBaseHelper.instance.add(
                              Grosery(name: widget.textController.text),
                            );
                      setState(() {
                        widget.textController.clear();
                        widget.selectedId;
                        print("PressedButton");
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                      height: 65,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.5),
                        color: Colors.blueAccent,
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 1,
                            blurRadius: 9,
                            offset: const Offset(0, 3),
                            color: Colors.blue.withOpacity(0.3),
                          )
                        ],
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
