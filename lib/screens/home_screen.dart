// ignore_for_file: prefer_const_constructors, prefer_collection_literals, avoid_unnecessary_containers, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:tlydp/shared/search_appBar.dart';
import 'package:tlydp/widgets/filter_button.dart';
import '../reusables/navbar/nav.dart';
import '../shared/menu_drawer.dart';
import '../shared/map.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        title: 'Home Page',
        showMenu: true,
      ),
      drawer: MenuDrawer(),
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          FilterButton(),
          Expanded(child: CustomMap()),
        ],
      )),
      bottomNavigationBar: Nav(),
    );
  }
}
