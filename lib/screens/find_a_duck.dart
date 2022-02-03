// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tlydp/backend_utils/api.dart';
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
  final _locationSearchKey = GlobalKey<FormBuilderState>();
  late String locationPlaced;
  
  Future getAddress(locationPlacedLat, locationPlacedLng) async {
    final response = await CallApi().getData(locationPlacedLat, locationPlacedLng);

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
          Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: Text(
                "Find A Duck",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "CherryBomb",
                  fontSize: 40,
                ),
            ),
          ),
          FormBuilder(
            key: _locationSearchKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  child: FormBuilderTextField(
                    initialValue: "",
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: 'Find ducks near you',
                    ),
                    name: "Find ducks near you",
                  )
                ),
                GestureDetector(
                  onTap: () {
                    _locationSearchKey.currentState!.fields["Find ducks near you"]!.save();
                  },
                  child: Padding(
                    padding:const EdgeInsets.all(15),
                    child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.25),
                          offset: const Offset(-6, 6)
                        )
                      ],
                      color: Color.fromARGB(255, 255, 112, 112)
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text("Search",
                      style: TextStyle(
                        fontFamily: "CherryBomb",
                        fontSize: 24,
                        color: Colors.white
                      ),),
                    ))
                  )
                )
              ],),
            ),
          Expanded(
                  child: ListView.builder(
                    itemCount: ducksToFind.length,
                    itemBuilder: (BuildContext context, int index) {
                      getAddress(ducksToFind[index].locationPlacedLat, ducksToFind[index].locationPlacedLng);
                      return FindDuckCard(
                        ducksToFind[index],
                        ducksToFind[index].duckName,
                        locationPlaced,
                        ducksToFind[index].clue,
                      );
                    },
                  ),
                )
        ]),
      ),
      bottomNavigationBar: Nav(),
    );
  }
}
