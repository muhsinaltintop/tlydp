import 'package:flutter/material.dart';

class DuckCard extends StatelessWidget {
  String duckName;
  String locationFound;
  String comments;
  String img;

  DuckCard(this.duckName, this.locationFound, this.comments, this.img, {Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      height: 150,
      width: 350,
      alignment: Alignment.center,
      decoration: BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(255, 185, 137, 109),
        width: 3),
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 241, 216, 129),
        boxShadow: [
          BoxShadow(
          color: Colors.grey.withOpacity(0.8),
          offset: const Offset(-6, 6),
        ),],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Text(duckName, 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
                color: Color.fromARGB(255, 255, 112, 112)
              ),
            )
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Text(locationFound, 
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: Color.fromARGB(255, 255, 112, 112)
              ),
            )
          ),
          Image(
            image: NetworkImage(img),
            width: 30,
          )
        ]
      )
    );
  }
}