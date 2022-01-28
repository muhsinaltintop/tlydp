import 'package:flutter/material.dart';
import 'package:tlydp/data/ducks_to_find.dart';
import 'package:tlydp/data/utils.dart';
import 'package:tlydp/reusables/navbar/nav.dart';
import 'package:tlydp/shared/menu_drawer.dart';
import 'package:tlydp/widgets/find_duck_card.dart';
import 'package:tlydp/widgets/location_input.dart';

class FindADuck extends StatefulWidget {
  const FindADuck({Key? key}) : super(key: key);

  @override
  FindADuckState createState() => FindADuckState();
}

class FindADuckState extends State<FindADuck> {  
  List<DucksToFind> ducksToFind = Utils.getDucksToFind();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      drawer: const MenuDrawer(),
      body: Container(
              child: Column(
              children: [
                const LocationInput(),
                const Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                  child: Text("Find A Duck",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "CherryBomb",
                      fontSize: 40,
                    ),
                  )
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ducksToFind.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: FindDuckCard(
                            ducksToFind[index].duckName,
                            ducksToFind[index].locationPlaced,
                            ducksToFind[index].clues,
                          ),
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
