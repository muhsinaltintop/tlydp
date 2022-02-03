// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tlydp/backend_utils/api.dart';
import 'package:tlydp/backend_utils/globals.dart';
import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/screens/my_duck_makes.dart';
import 'package:tlydp/shared/menu_drawer.dart';
import '../reusables/navbar/nav.dart';

class RegisterDuck extends StatefulWidget {
  const RegisterDuck({Key? key}) : super(key: key);

  @override
  _RegisterDuckState createState() {
    return _RegisterDuckState();
  }
}

class _RegisterDuckState extends State<RegisterDuck> {
  final _registerDuckKey = GlobalKey<FormBuilderState>();
  final _names = RegExp(r"^[a-zA-Z]+$");
  String errorMessage = "";

  Future<DuckModel> registerDuck(String duckName, String clue) async {
    // please add double locationPlacedLat, double locationPlacedLng as arguments for this function when place search is done

    final data = {
      "duck_name": duckName,
      "maker_id": currentUser.userId,
      "location_placed_lat": 53.488087, // please change this to locationPlacedLat when place search is done
      "location_placed_lng": -10.022186, // please change this to locationPlacedLng for the same reason above
      "clue": clue,
    };
    final response = await CallApi().postData(data, "ducks");
    final responseBody = response.body;

    print(responseBody);

    if (response.statusCode == 201) {
      Map<String, dynamic> duckResponse = jsonDecode(responseBody);
      final duckObject = duckResponse["duck"];
      return DuckModel(
        duckObject["duck_id"],
        duckObject["duck_name"],
        duckObject["maker_id"],
        duckObject["finder_id"],
        duckObject["location_placed_lat"],
        duckObject["location_placed_lng"],
        duckObject["location_found_lat"],
        duckObject["location_found_lng"],
        duckObject["clue"],
        duckObject["image"],
        duckObject["comments"],
        duckObject["maker_name"],
        duckObject["finder_name"]
      );
    } else {
      Map<String, dynamic> error = jsonDecode(responseBody);
      errorMessage = error["msg"];
      throw Exception(errorMessage);
    }
  }

  displayError() {
    return errorMessage != "" ? Text(errorMessage, style: const TextStyle(color: Colors.red),) : const Text("");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TLYDP",
              style: TextStyle(
                color: Color.fromARGB(255, 185, 137, 109),
                fontSize: 45,
                fontFamily: "CherryBomb",
              )),
          centerTitle: true,
          backgroundColor: Colors.white.withOpacity(0.5),
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
          child: Column(
            children: [
              FormBuilder(
                key: _registerDuckKey,
                child: Column(
                children: [
                  SizedBox(
                        height: 100,
                  ),
                  _registerDuckLabel(),
                  SizedBox(
                        height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      height: 40,
                      width: 250,
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelText: 'Name of Duck',
                        ),
                        name: "Name of Duck",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter the duck's name";
                          } else if (_names.hasMatch(value) == false) {
                            return "Please enter a valid name";
                          }
                        }
                      )
                    )
                  ),
                  // vvvvv place search goes here vvvvv
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      height: 40,
                      width: 250,
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelText: 'Location placed',
                        ),
                        name: "Location placed",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter where you have placed this duck";
                          }
                        }
                      )
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SizedBox(
                      height: 40,
                      width: 250,
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelText: 'Clue',
                        ),
                        name: "Clue",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a clue for finders";
                          }
                        }
                      )
                    )
                  ),
                  displayError(),
                  GestureDetector(
                        onTap: () async {
                          if (_registerDuckKey.currentState!.validate()) {
                            _registerDuckKey.currentState!.save();
                            final DuckModel newDuck = await registerDuck(
                              _registerDuckKey.currentState!.fields["Name of Duck"]!.value, 
                              _registerDuckKey.currentState!.fields["Clue"]!.value,
                            );
                            setState(() {
                              Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => DuckMakes()));
                            });
                          }
                        },
                        child: Padding(
                          padding:const EdgeInsets.all(0),
                          child: Container(
                          height: 70,
                          width: 220,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(21),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(-6, 6)
                              )
                            ],
                            color: const Color.fromARGB(255, 255, 112, 112)
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Text("Send out to \nthe world",
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              fontFamily: "CherryBomb",
                              fontSize: 24,
                              color: Colors.white
                            ),),
                          ))
                        )
                      ),
                ])
              ),
              
            ],)
        ),
        bottomNavigationBar: Nav(),
      );
  }
}


Widget _registerDuckLabel() {
  return Center(
    child: Container(
      height: 80,
      width: 250,
      child: const Text('Register A New Duck',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: "CherryBomb",
          fontSize: 38,
          color: Color.fromARGB(255, 7, 106, 163),
        )
      )
    )
  );
}