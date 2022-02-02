import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tlydp/backend_utils/api.dart';
import 'package:tlydp/backend_utils/globals.dart';
import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/screens/landing_screen.dart';
import 'package:tlydp/screens/my_duck_finds.dart';
import 'package:tlydp/shared/menu_drawer.dart';
import '../widgets/app_button.dart';
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

  Future patchDuck(String duckName, String comment) async {
    int duckId = foundDuck.duckId;
    final data = {
      "finder_id": currentUser.userId,
      "location_found_lat": 38.7894166,
      "location_found_lng": 7.986,
      "image":
          "https://www.shutterstock.com/image-vector/yellow-duck-toy-inflatable-rubber-vector-1677879052",
      "comments": comment,
    };
    final response = await CallApi().patchData(data, 'ducks/$duckId');
    final responseBody = response.body;

    print(responseBody);

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DuckFinds()),
      );
    } else {
      Map<String, dynamic> error = jsonDecode(responseBody);
      errorMessage = error["msg"];
      throw Exception(errorMessage);
    }
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
        backgroundColor: Colors.amber,
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
                        height: 20,
                      ),

                      image != null? Image.file(image!, 
                      width: 160,
                      height: 160,
                      fit: BoxFit.cover,
                      ) : _LogDuckLabel(),
                      SizedBox(
                        height: 30,
                      ),
                      _imageDuck(),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () => pickImage(ImageSource.gallery),
                          child: const Text("Upload Image")),
                      SizedBox(
                        height: 10,
                      ),
                      // ElevatedButton(
                      //     onPressed: () => pickImage(ImageSource.camera),
                      //     child: const Text("Take a Picture")),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      FormBuilderTextField(
                        initialValue: foundDuck.duckName,
                        decoration: const InputDecoration(
                          labelText: 'Name of Duck',
                        ),
                        name: "Name of Duck",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a duck name";
                          }
                          // Get usernames from backend to check username is not already taken
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      // _labelTextInput('Location', 'Location', false), Place location here.
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      FormBuilderTextField(
                        decoration: const InputDecoration(
                          labelText: 'Comments',
                        ),
                        name: "Comments",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a comment";
                          }
                          // Get usernames from backend to check username is not already taken
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            final _valid = _LogDuckKey.currentState!.validate();
                            if (_valid) {
                              _LogDuckKey.currentState!.save();

                              final patchedDuck = await patchDuck(
                                _LogDuckKey.currentState!
                                    .fields["Name of Duck"]!.value,
                                _LogDuckKey
                                    .currentState!.fields["Comments"]!.value,
                              );
                            }
                          },
                          child: const Text("Found!")),
                      SizedBox(
                        height: 30,
                      ),
                      Nav(),
                    ],
                  ),
                ))
          ]),
        )),
      ),
    );
  }
}

Widget _imageDuck() {
  return Center(
      child: Image.asset(
    "assets/images/yellow-outlined-duck.png",
    width: 100,
  ));
}

Widget _LogDuckLabel() {
  return Center(
    child: Text('Log a Found Duck',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 34,
        )),
  );
}

Widget _labelTextInput(String label, String hintText, bool isPassword) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: Color.fromARGB(255, 17, 105, 7),
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty';
          }
          return null;
        },
        obscureText: isPassword,
        cursorColor: Color.fromARGB(255, 22, 136, 7),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color.fromARGB(188, 136, 172, 139),
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffdfe8f3)),
          ),
        ),
      ),
    ],
  );
}
