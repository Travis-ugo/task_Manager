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
      backgroundColor: const Color(0xFFfbfbff),
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
                        color: Colors.blueGrey.shade100,
                        width: 1.5,
                      ),
                    ),
                    child: const Icon(
                      CupertinoIcons.xmark,
                      color: Colors.black,
                    ),
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
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  hintText: "Enter New Task",
                  hintStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: Color(0xFFf9f9ff),
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
                          const Icon(
                            IconlyLight.calendar,
                            color: Color(0xFFf9f9ff),
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.4),
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
            ],
          ),
        ),
      ),
    );
  }
}
