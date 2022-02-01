import 'package:flutter/material.dart';
import 'package:tlydp/screens/about_us_screen.dart';
import 'package:tlydp/screens/profile_screen.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: IconButton(
              iconSize: 70,
              onPressed: () { 
                // Go to map page
              }, 
              icon: Image.asset("assets/images/map-icon.png"),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(1, 1),
                )
              ]
            )
          ),
          Container(
            child: IconButton(
              iconSize: 70,
              onPressed: () {
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const ProfilePage()));
              }, 
              icon: Image.asset("assets/images/profile-icon.png"),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(1, 1),
                )
              ]
            )
          ),
          Container(
            child: IconButton(
              iconSize: 70,
              onPressed: () {
                Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => const AboutUs()));
              }, 
              icon: Image.asset("assets/images/aboutus-icon.png"),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(1, 1),
                )
              ]
            )
          ),
        ],
      )
    );
  }
}