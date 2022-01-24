// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white70,
            ),
            child: Text('The Little Yellow Duck Project',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.grey,
                  )
                ])),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                child: Text('About us',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 70),
                  primary: Color.fromARGB(255, 223, 105, 8),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                child: Text('Login',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 70),
                  primary: Color.fromARGB(255, 223, 105, 8),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                child: Text('Create an account',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 70),
                  primary: Color.fromARGB(255, 223, 105, 8),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ElevatedButton(
                child: Text('View map',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(250, 70),
                  primary: Color.fromARGB(255, 223, 105, 8),
                )),
          ),
        ],
      ),
    )));
  }
}
