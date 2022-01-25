import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Stack(
        children[
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height:80,
              color: Colors.yellow,
              child: Stack(children: []), 
            
            ),)
        ]
      )
    );
  }
}