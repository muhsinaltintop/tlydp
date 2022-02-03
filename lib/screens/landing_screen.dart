// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tlydp/screens/view_map_screen.dart';
import 'package:tlydp/screens/registration_page.dart';
import 'package:tlydp/widgets/app_button.dart';
import './login_screen.dart';
import './about_us_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 90, 20, 0),
                    child: Text('TLYDP',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: "CherryBomb",
                            fontSize: 72,
                            color: Color.fromARGB(255, 185, 137, 109)
                            )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppButton(
                    text: 'About us',
                    onClick: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppButton(
                      text: 'Login',
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppButton(
                      text: 'Create an account',
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Register()));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AppButton(
                      text: 'View map',
                      onClick: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => ViewMap()));
                      }),
                ),
              ],
            ),
          ),
        ));
  }
}
