// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../shared/menu_drawer.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
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
    );
  }
}
