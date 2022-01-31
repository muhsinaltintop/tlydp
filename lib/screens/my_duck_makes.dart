import 'package:flutter/material.dart';
import 'package:tlydp/data/user_made_ducks.dart';
import 'package:tlydp/data/utils.dart';
import 'package:tlydp/reusables/navbar/nav.dart';
import 'package:tlydp/widgets/user_made_duck_card.dart';

class DuckMakes extends StatefulWidget {
  const DuckMakes({Key? key}) : super(key: key);

  @override
  DuckMakesState createState() => DuckMakesState();
}

class DuckMakesState extends State<DuckMakes> {  
  List<UserMadeDucks> duckMakes = Utils.getUserMadeDucks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text("TLYDP",
            style: TextStyle(
              fontFamily: "CherryBomb",
              fontSize: 60,
              color: Color.fromARGB(255, 185, 137, 109)
            ),
          )
        ),
        backgroundColor: Colors.white.withOpacity(0.75),
      ),
      body: Container(
              child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text("Ducks I've Made",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "CherryBomb",
                      fontSize: 40,
                    ),
                  )
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: duckMakes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: Container(
                          child: UserMadeDuckCard(
                            duckMakes[index].duckName,
                            duckMakes[index].locationPlaced
                          ),
                        ),
                        onTap: () {
                          showDuckInfo(
                            context, 
                            duckMakes[index].duckName,
                            duckMakes[index].locationPlaced,
                            duckMakes[index].clues,
                          );
                        },
                      );
                    },
                  ),
                ),
                const Nav()]
              ),
            ),
    );
  }
}

showDuckInfo(context, duckName, locationPlaced, clues) {
  return showDialog(
    context: context, 
    builder: (context) {
      return Center(
        child: Material(
          type: MaterialType.transparency,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(-6, 6),
              ),],
              border: Border.all(
                color: const Color.fromARGB(255, 185, 137, 109),
                width: 3
              ),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 241, 216, 129),
            ),
            padding: const EdgeInsets.all(15),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 300,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(duckName, 
                      style: const TextStyle(
                        fontFamily: "CherryBomb",
                        fontSize: 50,
                        color: Color.fromARGB(255, 255, 112, 112)
                      ),
                )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(locationPlaced, 
                        style: const TextStyle(
                          fontFamily: "CherryBomb",
                          fontSize: 30,
                          color: Color.fromARGB(255, 255, 112, 112)
                        ),
                        maxLines: 3,
                )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(clues, 
                        style: const TextStyle(
                          fontFamily: "CherryBomb",
                          fontSize: 18,
                          color: Color.fromARGB(255, 185, 137, 109)
                        ),
                        maxLines: 10,
                ))
              ]
            )
          ),
        ),
      );
    }
  );
}