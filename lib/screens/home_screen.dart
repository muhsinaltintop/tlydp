// ignore_for_file: prefer_const_constructors, prefer_collection_literals, avoid_unnecessary_containers, sized_box_for_whitespace
import 'dart:html';
import 'package:flutter/material.dart';
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
  final TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 223, 105, 8),
        leading: _isSearching
            ? const BackButton()
            : Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Image(
                      image:
                          AssetImage("assets/images/yellow-outlined-duck.png"),
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip:
                        MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              ),
        title: _isSearching
            ? _buildSearchField()
            : Text('Home Page',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white)),
        actions: _buildActions(),
      ),
      drawer: MenuDrawer(),
      body: Container(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          FilterButton(),
          Expanded(child: Map()),
        ],
      )),
      bottomNavigationBar: Nav(),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchQueryController,
      autofocus: true,
      decoration: InputDecoration(
        hintText: "Search by city",
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.white30),
      ),
      style: TextStyle(color: Colors.white, fontSize: 16.0),
      onSubmitted: (query) => print(query), // make API call to google maps
    );
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            // make API call to google maps
            // _clearSearchQuery();
          },
        ),
      ];
    }

    return <Widget>[
      IconButton(
        icon: const Icon(Icons.search),
        onPressed: _startSearch,
      ),
    ];
  }

  void _startSearch() {
    ModalRoute.of(context)
        ?.addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));

    setState(() {
      _isSearching = true;
    });
  }

  void updateSearchQuery(String newQuery) {
    setState(() {
      searchQuery = newQuery;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();

    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchQueryController.clear();
      updateSearchQuery("");
    });
  }
}
