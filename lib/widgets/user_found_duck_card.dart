import 'package:flutter/material.dart';

class UserFoundDuckCard extends StatelessWidget {
  String duckName;
  String locationFound;
  String img;

  UserFoundDuckCard(this.duckName, this.locationFound, this.img, {Key? key}) : super(key: key);

  @override 
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
            child: Text(duckName, 
              style: const TextStyle(
                fontFamily: "CherryBomb",
                fontSize: 50,
                color: Color.fromARGB(255, 255, 112, 112)
              ),
          )),
          Positioned(
            top: 75,
            left: 30,
            child: Text(locationFound, 
              style: const TextStyle(
                fontFamily: "CherryBomb",
                fontSize: 30,
                color: Color.fromARGB(255, 255, 112, 112)
              ),
            )
          ),
          Positioned(
            top: 10,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(img),
                height: 120,
              )
            )
          )
        ]
      )
    );
  }
}