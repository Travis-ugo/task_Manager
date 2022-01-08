import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'DataBase/database_helperclass.dart';
import 'DataBase/grosary_class.dart';
import 'Views/home_page.dart';
import 'Views/new_todo.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(primaryColor: Colors.grey.shade800),
      theme: ThemeData(
        primaryColor: const Color(0xFFf6f6f6),
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      title: "TodoApp",
      home: const HomePage(),
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
