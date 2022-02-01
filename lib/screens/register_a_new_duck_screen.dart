import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:email_validator/email_validator.dart';
import 'package:tlydp/backend_utils/api.dart';
import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/screens/landing_screen.dart';
import 'package:tlydp/screens/login_screen.dart';
import 'package:tlydp/screens/my_duck_makes.dart';
import 'package:tlydp/screens/profile_screen.dart';

class RegisterDuck extends StatefulWidget {
  const RegisterDuck({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _RegisterDuckState();
  }
}

class _RegisterDuckState extends State<RegisterDuck> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _duckName = RegExp(r"^[a-zA-Z]+$");
  final _location = RegExp(r"^[a-zA-Z]+$");
  final _clues = RegExp(r"^[a-zA-Z]+$");
  late final currentDuck;
  String errorMessage = "";

  Future<DuckModel?> registerDuck(String duckName, String location,
      String clues) async {
    final data = {
      "duck_name": duckName,
      "location": location,
      "clues": clues,
    };
    final response = await CallDuckApi().postDuck(data, "register");
    final responseBody = response.body;

    if (response.statusCode == 201) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const ProfilePage()),
      // );
      Map<String, dynamic> duckResponse = jsonDecode(responseBody);
      final duckObject = duckResponse["duck"];
      return DuckModel(
        duckObject["duck_name"],
        duckObject["location"],
        duckObject["clues"],
      );
    } else {
      Map<String, dynamic> error = jsonDecode(responseBody);
      errorMessage = error["msg"];
      return null;
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

  Widget build(BuildContext context) {
    return Material(
        child: Column(children: [
      IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LandingScreen()),
          );
        },
      ),
      FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                decoration: const InputDecoration(
                  labelText: 'Duck Name',
                ),
                name: "Duck Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter duck name";
                  } else if (_duckName.hasMatch(value) == false) {
                    return "Please enter a valid duck name";
                  }
                },
              ),
              FormBuilderTextField(
                decoration: const InputDecoration(
                  labelText: 'Location',
                ),
                name: "Location",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a city name";
                  } else if (_location.hasMatch(value) == false) {
                    return "Please enter a valid city name";
                  }
                },
              ),
              FormBuilderTextField(
                decoration: const InputDecoration(
                  labelText: 'Clues',
                ),
                name: "Clues",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter clear clues";
                  } else if (_location.hasMatch(value) == false) {
                    return "Clue is too short";
                  }
                },
              ),
              displayError(),
              ElevatedButton(
                  onPressed: () async {
                    final _valid = _formKey.currentState!.validate();
                    if (_valid) {
                      _formKey.currentState!.save();

                      final DuckModel? newDuck = await registerDuck(
                          _formKey.currentState!.fields["Duck Name"]!.value,
                          _formKey.currentState!.fields["Location"]!.value,
                          _formKey.currentState!.fields["Clues"]!.value,

                      setState(() {
                        if (newDuck != null) {
                          currentDuck = newDuck;
                          
                          Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DuckMakes()));
                          }
                        }
                      
                      );
                    }
                  },
                  child: const Text("Register")),
              InkWell(
                  child: const Text("Login instead"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  }),
            ],
          ))
    ]));
  }
}
