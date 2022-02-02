import 'package:flutter/material.dart';
import 'package:tlydp/backend_utils/globals.dart';
import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/data/utils.dart';
import 'package:tlydp/reusables/navbar/nav.dart';
import 'package:tlydp/shared/menu_drawer.dart';
import 'package:tlydp/widgets/user_made_duck_card.dart';

class DuckMakes extends StatefulWidget {
  const DuckMakes({Key? key}) : super(key: key);

  @override
  DuckMakesState createState() => DuckMakesState();
}

class DuckMakesState extends State<DuckMakes> {  
  List<DuckModel> duckMakes = Utils.getDucksMadeByUser(currentUser.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("TLYDP",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.grey,
                  ),
                ],
              )
          ),
          centerTitle: true,
          backgroundColor: Colors.white70,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Image(
                  image: AssetImage("assets/images/yellow-outlined-duck.png"),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
      drawer: const MenuDrawer(),
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
                            duckMakes[index].locationPlacedLng,
                            duckMakes[index].locationPlacedLng
                          ),
                        ),
                        onTap: () {
                          showDuckInfo(
                            context, 
                            duckMakes[index].duckName,
                            duckMakes[index].locationPlacedLng,
                            duckMakes[index].locationPlacedLng,
                            duckMakes[index].clue
                          );
                        },
                      );
                    },
                  ),
                ),
                const Nav()
                ]
              ),
            ),
    );
  }
}

showDuckInfo(context, duckName, locationPlacedLat, locationPlacedLng, clue) {
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
            height: 200,
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
                  child: Text("$locationPlacedLat, $locationPlacedLng", 
                        style: const TextStyle(
                          fontFamily: "CherryBomb",
                          fontSize: 30,
                          color: Color.fromARGB(255, 255, 112, 112)
                        ),
                        maxLines: 3,
                )),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(clue, 
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