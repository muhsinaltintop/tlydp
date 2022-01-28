// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tlydp/screens/my_duck_makes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(
            scaffoldBackgroundColor: Color.fromARGB(255, 140, 221, 240), 
          ),
      home: DuckMakes(),
    );
  }
}
