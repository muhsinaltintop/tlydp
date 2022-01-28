// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 255, 209, 6)),
      home: LandingScreen(),
    );
  }
}
