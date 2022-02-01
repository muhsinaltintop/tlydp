// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tlydp/shared/search_appBar.dart';
import '../shared/map.dart';

class ViewMap extends StatelessWidget {
  const ViewMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: SearchAppBar(
          title: 'The Little Yellow Duck Project',
          showMenu: false,
        ),
        body: Center(child: CustomMap()));
  }
}
