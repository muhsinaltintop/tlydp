// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'landing_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                MaterialPageRoute(builder: (context) => const LandingScreen()),
              );
            }),
        SizedBox(
          height: 20,
        ),
        _appName(),
        SizedBox(
          height: 70,
        ),
        _aboutUsText(),
        SizedBox(height: 30),
        _duckImage(),
        SizedBox(
          height: 20,
        ),
        InkWell(
            child: Text(
              'Read more here',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Color.fromARGB(255, 7, 106, 163),
                fontSize: 20,
              ),
            ),
            onTap: () => launch('https://thelittleyellowduckproject.org/')),
        SizedBox(height: 40),
      ],
    )));
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
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, shadows: [
          Shadow(
            offset: Offset(1.0, 1.0),
            blurRadius: 2.0,
            color: Colors.grey,
          )
        ])),
  );
}

Widget _aboutUsText() {
  return Container(
      child: Text(
          'The Little Yellow Duck Project is a global initiative highlighting the life-saving random acts of kindness of blood, bone marrow, and organ and tissue donation. It involves people around the world handcrafting little yellow duck gifts as random acts of kindness that are left in public places for others to find. We hope that the stories and information found here will encourage them to pledge their own random act of kindness by registering to donate blood, bone marrow, organs tissues.'));
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
