import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tlydp/backend_utils/api.dart';

class UserMadeDuckCard extends StatefulWidget {
  String duckName;
  double locationPlacedLat;
  double locationPlacedLng;
  String? image;

  UserMadeDuckCard(this.duckName, this.locationPlacedLat, this.locationPlacedLng, this.image, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserMadeDuckCardState();
  }
}

class UserMadeDuckCardState extends State<UserMadeDuckCard> {

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
            child: Text(widget.duckName, 
              style: const TextStyle(
                fontFamily: "CherryBomb",
                fontSize: 50,
                color: Color.fromARGB(255, 255, 112, 112)
              ),
          )),
          Positioned(
            width: 300,
            top: 75,
            left: 30,
            child: AutoSizeText("${widget.locationPlacedLat}, ${widget.locationPlacedLng}", 
              style: const TextStyle(
                fontFamily: "CherryBomb",
                fontSize: 20,
                color: Color.fromARGB(255, 255, 112, 112)
              ),
              maxLines: 2,
              minFontSize: 15,
            )
          ),
          (widget.image != null ? 
          Positioned(
            top: 10,
            right: 20,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(
                image: NetworkImage(widget.image!),
                // height: 120,
                width: 120,
              )
            )
          ): const Text(""))
        ]
      )
    );
  }
}