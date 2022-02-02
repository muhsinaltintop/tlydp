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
      key: _loginKey,
      child: Scaffold(
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
                        height: 70,
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LandingScreen()),
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _appName(),
                      SizedBox(
                        height: 70,
                      ),
                      _loginLabel(),
                      SizedBox(
                        height: 70,
                      ),
                      FormBuilderTextField(
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                        name: "Username",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your username";
                          }
                        },
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      FormBuilderTextField(
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                        name: "Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter your password";
                          }
                        },
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 90,
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
                                    Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => ProfilePage()));
                                });
                                
                              }
                        },
                      ),
                      SizedBox(
                        height: 70,
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
  return Container(
    padding: EdgeInsets.all(24),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white70,
    ),
    child: Text('The Little Yellow Duck Project',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,
            // ignore: prefer_const_literals_to_create_immutables
            shadows: [
              Shadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 2.0,
                color: Colors.grey,
              )
            ])),
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

Widget _loginLabel() {
  return Center(
    child: Text('Login',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 34,
        )),
  );
}