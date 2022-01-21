import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Views/Drawer Fuction/drawer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primaryColor: const Color(0xFF0d2260),
      ),
      theme: ThemeData(
        primaryColor: const Color(0xFFf9f9ff),
        textTheme: GoogleFonts.varelaRoundTextTheme(),
      ),
      title: "TodoApp",
      home: const CustomDrawer(),
    );
  }
}
