// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tlydp/shared/menu_drawer.dart';
// import 'package:http/http.dart' as http;

class LandingScreen extends StatefulWidget {
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final url = 'https://tlydp.herokuapp.com/api/ducks';

  var _ducksJson = [];

  void fetchDucks() async {
    try {
      final response = await get(Uri.parse(url));
      final jsonData = jsonDecode(response.body) as List;

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
              final duck = _ducksJson[i];
              return Text("Duck Name: ${duck["duck_name"]}");
            }),
      ),
    );
  }
}
