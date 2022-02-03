// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tlydp/backend_utils/globals.dart';
import 'package:tlydp/data/allducks.dart';
import 'package:tlydp/screens/my_duck_finds.dart';
import 'package:tlydp/shared/menu_drawer.dart';
import '../reusables/navbar/nav.dart';

class LogDuck extends StatefulWidget {
  const LogDuck({Key? key}) : super(key: key);

  @override
  _LogDuckState createState() {
    return _LogDuckState();
  }
}

class _LogDuckState extends State<LogDuck> {
  final _LogDuckKey = GlobalKey<FormBuilderState>();
  String errorMessage = "";
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  patchDuck(String duckName, String comments) async {    
    final patchedDuck = ducks.map((duck) => {
      if (duck.duckName == duckName) {
        duck.finderId = currentUser.userId,
        duck.finderName = currentUser.userName,
        duck.comments = comments,
        duck.locationFoundLat = 38.7894166,
        duck.locationFoundLng = 7.986,
        duck.image = "https://www.shutterstock.com/image-vector/yellow-duck-toy-inflatable-rubber-vector-1677879052"
      }
    });
    print(patchedDuck);
    return patchedDuck;
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
    return FormBuilder(
      key: _LogDuckKey,
      child: Scaffold(
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
        backgroundColor: const Color.fromARGB(255, 140, 221, 240),
        body: SingleChildScrollView(
            child: SizedBox(
          child: Stack(children: [
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      SizedBox(
                        // height: 70
                        height: 20,
                      ),
                      _LogDuckLabel(),
                      // image != null? Image.file(image!, 
                      // width: 160,
                      // height: 160,
                      // fit: BoxFit.cover,
                      // ) : _imageDuck(),
                      //   SizedBox(
                      //   height: 30,
                      // ),
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
                                return "Please enter a duck name";
                              }
                            },
                          )
                        )
                      ),
                      // vvvvv place search here vvvvv
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
                              labelText: 'Location found',
                            ),
                            name: "Location found",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter where you found this duck";
                              }
                            }
                          )
                        )
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          pickImage(ImageSource.gallery);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(-6, 6),
                              ),
                            ],
                            border: Border.all(
                              color: const Color.fromARGB(255, 185, 137, 109),
                              width: 4
                            ),
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 241, 216, 129),
                          ),
                          width: 160,
                          height: 40,
                          child: Align(
                            alignment: Alignment.center,
                            child: AutoSizeText("Upload picture", 
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: "CherryBomb",
                                fontSize: 18,
                                color: Color.fromARGB(255, 185, 137, 109),
                              )
                            )
                          )
                        )
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                           pickImage(ImageSource.camera);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                offset: const Offset(-6, 6),
                              ),
                            ],
                            border: Border.all(
                              color: const Color.fromARGB(255, 185, 137, 109),
                              width: 4
                            ),
                            borderRadius: BorderRadius.circular(25),
                            color: const Color.fromARGB(255, 241, 216, 129),
                          ),
                          width: 160,
                          height: 40,
                          child: Align(
                            alignment: Alignment.center,
                            child: AutoSizeText("Take a picture", 
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: "CherryBomb",
                                fontSize: 18,
                                color: Color.fromARGB(255, 185, 137, 109),
                              )
                            )
                          )
                        )
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: SizedBox(
                          height: 40,
                          width: 250,
                          child: FormBuilderTextField(
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              labelText: 'Comments',
                            ),
                            name: "Comments",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter a comment";
                              }
                            },
                          )
                        )
                      ),
                      GestureDetector(
                        onTap: () async {
                          final _valid = _LogDuckKey.currentState!.validate();
                            if (_valid) {
                              _LogDuckKey.currentState!.save();
                              final patchedDuck = await patchDuck(
                                  _LogDuckKey.currentState!.fields["Name of Duck"]!.value,
                                  _LogDuckKey.currentState!.fields["Comments"]!.value,
                              );
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DuckFinds()),
                              );
                            }
                        },
                        child: Padding(
                          padding:const EdgeInsets.all(15),
                          child: Container(
                          height: 60,
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
                            child: Text("Found!",
                            style: TextStyle(
                              fontFamily: "CherryBomb",
                              fontSize: 30,
                              color: Colors.white
                            ),),
                          ))
                        )
                      ),                      
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ))
          ]),
        )),
        bottomNavigationBar: Nav(),
      ),
    );
  }
}

Widget _LogDuckLabel() {
  return Center(
    child: Container(
      height: 80,
      width: 250,
      child: const Text('Log A Found Duck',
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