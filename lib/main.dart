import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'musk/desktop.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
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
      home: const Desktop(),
    );
  }
}
