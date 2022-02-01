// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../screens/about_us_screen.dart';
import '../../screens/home_screen.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      child: Align(
          alignment: Alignment.bottomCenter,
          heightFactor: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  child: IconButton(
                    iconSize: 70,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home()));
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
                      ])),
              Container(
                  child: IconButton(
                    iconSize: 70,
                    onPressed: () {
                      // Go to profile page
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
                      ])),
              Container(
                  child: IconButton(
                    iconSize: 70,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AboutUs()));
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
                      ])),
            ],
          )),
    );
  }
}
