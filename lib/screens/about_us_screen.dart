// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tlydp/backend_utils/globals.dart';
import 'package:tlydp/screens/landing_screen.dart';
import 'package:tlydp/screens/profile_screen.dart';
import 'package:tlydp/shared/menu_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          constraints: const BoxConstraints(maxHeight: 50),
                          iconSize: 120,
                          onPressed: () {
                            if (loggedIn == true) {
                              Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => ProfilePage()));
                            }
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => LandingScreen()));
                          },
                          icon: Image.asset("images/back-button.png"),
                        )
                      ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            height: 80,
            width: 250,
            child: const Text('About Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "CherryBomb",
                fontSize: 54,
                color: Color.fromARGB(255, 185, 137, 109),
              )
            )
          )
        ),
        _aboutUsText(),
        SizedBox(height: 40),
      ],
    )));
  }
}


Widget _aboutUsText() {
  return Container(
    decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(-6, 6),
              ),],
              border: Border.all(
                color: const Color.fromARGB(255, 185, 137, 109),
                width: 3
              ),
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 241, 216, 129),
            ),
            padding: const EdgeInsets.all(10),
            width: 350,
      child: Column( children: [SizedBox(height: 20), Container(width:300, child: Text(
          'The Little Yellow Duck Project is a global initiative highlighting the life-saving random acts of kindness of blood, bone marrow, and organ and tissue donation. It involves people around the world handcrafting little yellow duck gifts as random acts of kindness that are left in public places for others to find. We hope that the stories and information found here will encourage them to pledge their own random act of kindness by registering to donate blood, bone marrow, organs tissues.', 
          style: TextStyle(
                color: Color.fromARGB(255, 185, 137, 109),
                fontSize: 18,
                fontWeight: FontWeight.bold
              )
          )), SizedBox(
          height: 20,
        ),_duckImage(), SizedBox(height: 20),
        InkWell(
            child: Text(
              'Read more here',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 7, 106, 163),
                fontSize: 20,
              ),
            ),
            onTap: () => launch('https://thelittleyellowduckproject.org/')),SizedBox(height: 20)]));
}

Widget _duckImage() {
  return Center(
    child: SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
            "https://m.media-amazon.com/images/I/61emSsB83dL._SY500_.jpg"),
      ),
      height: 250,
    ),
  );
}
