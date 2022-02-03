// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tlydp/backend_utils/api.dart';
import 'package:tlydp/backend_utils/globals.dart';
import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/screens/profile_screen.dart';
import 'package:tlydp/widgets/app_button.dart';
import 'landing_screen.dart';
import 'registration_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormBuilderState>();String errorMessage = "";

  Future<UserModel> loginUser(String userName, String password) async {
    final data = {
      "user_name": userName,
      "password": password,
    };
    final response = await CallApi().postData(data, "users/login");
    final responseBody = response.body;

    if (response.statusCode == 200) {
      Map<String, dynamic> userResponse = jsonDecode(responseBody);
      final userObject = userResponse["user"];
      return UserModel(
        userObject["user_id"],
        userObject["user_name"],
        userObject["first_name"],
        userObject["last_name"],
        userObject["password"],
        userObject["email"],
        userObject["profile_pic"],
      );
    } else {
      Map<String, dynamic> error = jsonDecode(responseBody);
      setState(() {
        errorMessage = error["msg"];
      });
      throw Exception(errorMessage);
    }
  }

  Widget displayError() {
    return errorMessage != ""
        ? Text(
            errorMessage,
            style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
          )
        : const Text("");
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _loginKey,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 140, 221, 240),
        body: SingleChildScrollView(
            child: SizedBox(
          child: Stack(children: [
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          constraints: const BoxConstraints(maxHeight: 50),
                          iconSize: 120,
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => LandingScreen()));
                          },
                          icon: Image.asset("images/back-button.png"),
                        )
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _appName(),
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
                              labelText: 'Username',
                            ),
                            name: "Username",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your username";
                              }
                            },
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
                                borderRadius: BorderRadius.circular(15.0)
                              ),
                              labelText: 'Password',
                            ),
                            name: "Password",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your password";
                              }
                            },
                            obscureText: true,
                          )
                        )
                      ),
                      displayError(),
                      AppButton(
                        text: 'Login',
                        onClick: () async {
                          if (_loginKey.currentState!
                              .validate()) {
                                _loginKey.currentState!.save();

                                final UserModel user = await loginUser(
                                  _loginKey.currentState!.fields["Username"]!.value,
                                  _loginKey.currentState!.fields["Password"]!.value,
                                );

                                setState(() {
                                  currentUser = user;
                                  loggedIn = true;
                                    Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => ProfilePage()));
                                });
                          }
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _signUpLabel(),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromARGB(255, 7, 106, 163),
                              fontSize: 20,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Register()));
                          }),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ))
          ]),
        )),
      ),
    );
  }
}

Widget _appName() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(20, 35, 20, 15),
    child: Container(
        child: const Text('TLYDP',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "CherryBomb",
            fontSize: 72,
            color: Color.fromARGB(255, 185, 137, 109)
          )
        ),
    ),
  );
}

Widget _signUpLabel() {
  return Text("Don't have an account yet?",
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 189, 108, 33),
        fontSize: 18,
      ));
}