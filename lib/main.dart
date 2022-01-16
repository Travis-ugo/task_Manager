import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Views/drawer.dart';

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
      home: const CustomDrawer(),
    );
  }
}
