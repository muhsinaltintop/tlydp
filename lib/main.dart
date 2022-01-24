import 'package:flutter/material.dart';
import 'package:tlydp/registration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: const Register(),
        )
      )
    );
  }
}
