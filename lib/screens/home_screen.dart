// ignore_for_file: prefer_const_constructors, prefer_collection_literals, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import '../reusables/navbar/nav.dart';
import '../shared/menu_drawer.dart';
import '../shared/map.dart';
import '../widgets/map_radio_buttons.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 223, 105, 8),
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
          title: Text('Home Page',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white))),
      drawer: MenuDrawer(),
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(height: 100, child: MapRadioButton()),
          Expanded(child: Map()),
        ],
      )),
      bottomNavigationBar: Nav(),
    );
  }
}
