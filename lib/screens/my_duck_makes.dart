import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tlydp/backend_utils/api.dart';
import 'package:tlydp/backend_utils/globals.dart';
import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/reusables/navbar/nav.dart';
import 'package:tlydp/shared/menu_drawer.dart';
import 'package:tlydp/widgets/user_made_duck_card.dart';

class DuckMakes extends StatefulWidget {
  const DuckMakes({Key? key}) : super(key: key);

  @override
  DuckMakesState createState() => DuckMakesState();
}

class DuckMakesState extends State<DuckMakes> {  
  String errorMessage = "";

  Future<List<Set<DuckModel>>> getDucksByUser() async {
    // int makerId = currentUser.userId;
    String endpoint = "ducks?maker_id=2"; // $makerId
    final response = await CallApi().fetchData(endpoint);
    final responseBody = response.body;

    if (response.statusCode == 200) {
      Map<String, dynamic> ducksResponse = jsonDecode(responseBody);
      List ducksArray = ducksResponse["ducks"];
      if (ducksArray.isNotEmpty) {
        return ducksArray.map((duck) => {
          DuckModel(
            duck["duck_id"],
            duck["duck_name"],
            duck["maker_id"],
            duck["finder_id"],
            duck["location_placed_lat"],
            duck["location_placed_lng"],
            duck["location_found_lat"],
            duck["location_found_lng"],
            duck["clue"],
            duck["image"],
            duck["comments"],
            duck["maker_name"],
            duck["finder_name"]
          )
        }).toList();
      } else {
        throw Exception("Nothing here yet!");
      }
    } else {
      Map<String, dynamic> error = jsonDecode(responseBody);
      errorMessage = error["msg"];
      throw Exception(errorMessage);
    }
  }

  ListView duckMakes(data) {
    if (data != null) {
      return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
            final cards = data[index].forEach((value) => {
              tile(value.duckName, value.locationPlacedLat, value.locationPlacedLng)
                // InkWell(
                //   child: Container(
                //     child: UserMadeDuckCard(
                //       value.duckName, 
                //       value.locationPlacedLat,
                //       value.locationPlacedLng
                //     )
                //   ),
                //   onTap: () {
                //     showDuckInfo(
                //       context, 
                //       value.duckName,
                //       value.locationPlacedLat,
                //       value.locationPlacedLng,
                //       value.clue
                //     );
                //   },
                // )
            });
            return cards;
        }
      );
    } else {
      throw Exception("Null data");
    }
  }

  ListTile? tile(String duckName, num lat, num lng) { ListTile(
    title: Text(duckName,
      style: const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
      )
    ),
    subtitle: Text("$lat, $lng"),
    );
  }

  displayError() {
    return errorMessage != ""
        ? Text(
            errorMessage,
            style: const TextStyle(color: Colors.red),
          )
        : const Text("");
  }

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
                  child: FutureBuilder<List<Set<DuckModel>>> (
                    future: getDucksByUser(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          List<Set<DuckModel>> data = snapshot.data;
                          return duckMakes(data);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                      }
                      return const CircularProgressIndicator();
                    },
                  )
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