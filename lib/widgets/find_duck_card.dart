// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tlydp/backend_utils/globals.dart';
import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/screens/log_duck_screen.dart';

class FindDuckCard extends StatelessWidget {
  DuckModel duck;
  String duckName;
  double locationPlacedLat;
  double locationPlacedLng;
  String clue;

  FindDuckCard(this.duck, this.duckName, this.locationPlacedLat, this.locationPlacedLng, this.clue, {Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      width: 350,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 185, 137, 109),
          width: 3
        ),
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 241, 216, 129),
        boxShadow: [
          BoxShadow(
          color: Colors.black.withOpacity(0.25),
          offset: const Offset(-6, 6),
        ),],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Align(
            alignment: Alignment.topLeft,
            child: Text(duckName, 
              style: const TextStyle(
              fontFamily: "CherryBomb",
              fontSize: 50,
              color: Color.fromARGB(255, 255, 112, 112)
              ),
            )
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
            child: Align(
            alignment: Alignment.topLeft,
            child: Text("$locationPlacedLat, $locationPlacedLng", 
              style: const TextStyle(
                fontFamily: "CherryBomb",
                fontSize: 30,
                color: Color.fromARGB(255, 255, 112, 112)
              ),
            maxLines: 3,
            )
          )),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Align(
            alignment: Alignment.topLeft,
            child: Text(clue, 
              style: const TextStyle(
                fontFamily: "CherryBomb",
                fontSize: 18,
                color: Color.fromARGB(255, 185, 137, 109)
              ),
            maxLines: 10,
            )
          )),
          GestureDetector(
            onTap: () {
              foundDuck = duck;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LogDuck()));
            },
            child: Padding(
              padding:const EdgeInsets.all(15),
              child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(21),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(-6, 6)
                  )
                ],
                color: Colors.white
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text("Found!",
                style: TextStyle(
                  fontFamily: "CherryBomb",
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 112, 112)
                ),),
              ))
            )
          )
      ],)
    );
  }
}