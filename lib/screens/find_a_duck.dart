// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/data/utils.dart';
import 'package:tlydp/reusables/navbar/nav.dart';
import 'package:tlydp/shared/menu_drawer.dart';
import 'package:tlydp/widgets/find_duck_card.dart';

class FindADuck extends StatefulWidget {
  const FindADuck({Key? key}) : super(key: key);

  @override
  FindADuckState createState() => FindADuckState();
}

class FindADuckState extends State<FindADuck> {
  List<DuckModel> ducksToFind = Utils.getDucksToFind();

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
            )),
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
      drawer: MenuDrawer(),
      body: Container(
        child: Column(children: [
          // place search bar here
          Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Text(
                "Find A Duck",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "CherryBomb",
                  fontSize: 40,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ducksToFind.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FindDuckCard(
                        ducksToFind[index],
                        ducksToFind[index].duckName,
                        ducksToFind[index].locationPlacedLat,
                        ducksToFind[index].locationPlacedLng,
                        ducksToFind[index].clue,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ]),
      ),
      bottomNavigationBar: Nav(),
    );
  }
}
