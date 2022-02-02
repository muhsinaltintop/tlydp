import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:tlydp/backend_utils/api.dart';

class UserMadeDuckCard extends StatefulWidget {
  String duckName;
  double locationPlacedLat;
  double locationPlacedLng;

  UserMadeDuckCard(this.duckName, this.locationPlacedLat, this.locationPlacedLng, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserMadeDuckCardState();
  }
}

class UserMadeDuckCardState extends State<UserMadeDuckCard> {
  late String locationPlaced;
  
  Future getAddress() async {
    final response = await CallApi().getData(widget.locationPlacedLat, widget.locationPlacedLng);

    if (response != "Failed") {
      setState(() {
        locationPlaced = response.toString();
      });
      return response.toString();
    } else {
      throw Exception("Error");
    }
  }

  @override
  void initState() {
    getAddress();
    super.initState();
  }

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
            child: AutoSizeText(locationPlaced, 
              style: const TextStyle(
                fontFamily: "CherryBomb",
                fontSize: 20,
                color: Color.fromARGB(255, 255, 112, 112)
              ),
              maxLines: 2,
              minFontSize: 15,
            )
          ),
        ]
      )
    );
  }
}