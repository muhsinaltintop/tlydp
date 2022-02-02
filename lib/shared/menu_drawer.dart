// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tlydp/screens/landing_screen.dart';
import 'package:tlydp/screens/log_duck_screen.dart';
import 'package:tlydp/screens/register_a_new_duck_screen.dart';
import '../screens/home_screen.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: buildMenuItems(context),
    ));
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = [
      'Home',
      'Find a duck',
      'Log a found duck',
      'Register a new duck',
    ];
    List<Widget> menuItems = [];
    menuItems.add(Container(
      height: 200,
      child: DrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 140, 221, 240),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/yellow-outlined-duck.png'),
                  width: 50,
                  height: 50,
                ),
                SizedBox(
                  height: 20,
                ),
                Text('The Little Yellow Duck Project',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold)),
              ])),
    ));
    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
          title: Text(element, style: TextStyle(fontSize: 18)),
          onTap: () {
            switch (element) {
              case 'Home':
                screen = Home();
                break;
              case 'Find a duck':
                screen =
                    LandingScreen(); // change to 'find a duck' screen once created
                break;
              case 'Log a found duck':
                screen =
                    LogDuck();
                break;
              case 'Register a new duck':
                screen = RegisterDuck();
                break;
            }
            Navigator.of(context).pop();
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => screen));
          }));
    });
    return menuItems;
  }
}
