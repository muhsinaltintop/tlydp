// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tlydp/widgets/app_button.dart';
import 'landing_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginKey = GlobalKey<FormState>();

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
                      _labelTextInput('Username', 'YourUsername', false),
                      SizedBox(
                        height: 70,
                      ),
                      _labelTextInput('Password', 'yourpassword', true),
                      SizedBox(
                        height: 90,
                      ),
                      AppButton(
                        text: 'Login',
                        onClick: () {
                          if (_loginKey.currentState!
                              .validate()) {} // navigate to Home page
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
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) => RegisterScreen())); <<<<<<<<< THIS IS WHERE THE PAGE WILL BE REDIRECTED TO THE REGISTER SCREEN
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
