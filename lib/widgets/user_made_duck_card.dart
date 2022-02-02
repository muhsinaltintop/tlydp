import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';

class UserMadeDuckCard extends StatefulWidget {
  String duckName;
  double locationPlacedLat;
  double locationPlacedLng;

  UserMadeDuckCard(this.duckName, this.locationPlacedLat, this.locationPlacedLng, {Key? key}) : super(key: key);

  @override
  UserMadeDuckCardState createState() => UserMadeDuckCardState();
}

class UserMadeDuckCardState extends State<UserMadeDuckCard> {
  
  

  @override 
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 150,
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
      child: Stack(
        children: [
          Positioned(
            top: 25,
            left: 30,
            child: Text(widget.duckName, 
              style: const TextStyle(
                fontFamily: "CherryBomb",
                fontSize: 50,
                color: Color.fromARGB(255, 255, 112, 112)
              ),
          )),
          const Positioned(
            top: 75,
            left: 30,
            child: Text("Hello", 
              style: TextStyle(
                fontFamily: "CherryBomb",
                fontSize: 30,
                color: Color.fromARGB(255, 255, 112, 112)
              ),
            )
          ),
        ]
      )
    );
  }
}