// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:tlydp/shared/menu_drawer.dart';
// import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final url = 'https://tlydp.herokuapp.com/api/ducks';

  var _ducksJson = [];

  void fetchDucks() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body);

      print(jsonData);


      setState(() {
        _ducksJson = jsonData;
      });
    } catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    fetchDucks();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: _ducksJson.length,
            itemBuilder: (context, i) {
              final ducks = _ducksJson[i];
              return Text("Duck Name: ${ducks["duck_name"]}");
            }),
      ),
    );
  }
}
