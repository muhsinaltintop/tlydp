// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tlydp/widgets/app_button.dart';
import '../shared/menu_drawer.dart';
import './login_screen.dart';
import './about_us_screen.dart';
import './register_a_new_duck_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(''),
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
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white70,
                    ),
                    child: Text('The Little Yellow Duck Project',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 2.0,
                                color: Colors.grey,
                              )
                            ])),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AppButton(
                    text: 'About us',
                    onClick: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AppButton(
                      text: 'Login',
                      onClick: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AppButton(text: 'Create an account', onClick: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AppButton(text: 'View map', onClick: () {}),
                ),
              ],
            ),
          ),
        ));
  }
}
