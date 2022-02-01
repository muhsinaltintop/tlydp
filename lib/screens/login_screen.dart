// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:tlydp/backend_utils/api.dart';
import 'package:tlydp/screens/profile_screen.dart';
import 'package:tlydp/widgets/app_button.dart';
import 'landing_screen.dart';
import 'registration_page.dart';
import 'package:tlydp/backend_utils/model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormBuilderState>();
  late final currentUser;
  // bool isAPIcallProcess = false;

  Future<LoginModel?> loginUser(String userName, String password) async {
    final data = {"user_name": userName, "password": password};
    final response = await CallApi().postUser(data, "login");
   
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                      _usernameTextInput('Username', 'YourUsername'),
                      SizedBox(
                        height: 70,
                      ),
                      _passwordTextInput('Password', 'yourpassword'),
                      SizedBox(
                        height: 90,
                      ),
                      AppButton(
                        text: 'Login',
                        onClick: () async {
                          if (_loginKey.currentState!.validate()) {
                            _loginKey.currentState!.save();

                            final LoginModel? newUser = await loginUser(
                                _loginKey
                                    .currentState!.fields["Username"]!.value,
                                _loginKey
                                    .currentState!.fields["Upassword"]!.value);

                            setState(() {
                              if (newUser != null) {
                              currentUser = newUser;

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ProfilePage()));
                              }
                            });
                          } // navigate to Home page
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

Widget _usernameTextInput(String label, String hintText) {
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
            return 'Username field cannot be empty';
          }
          return null;
        },
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

Widget _passwordTextInput(String label, String hintText) {
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
            return 'Please enter your password';
          }
          return null;
        },
        obscureText: true,
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
