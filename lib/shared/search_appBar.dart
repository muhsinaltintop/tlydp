// ignore_for_file: prefer_final_fields, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import './map.dart';
import 'dart:convert';

GlobalKey<_SearchAppBarState> searchBarKey = GlobalKey();

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool showMenu;

  const SearchAppBar({Key? key, required this.title, required this.showMenu})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  final TextEditingController _searchQueryController = TextEditingController();
  bool _isSearching = false;
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 223, 105, 8),
      leading: _isSearching || !widget.showMenu
          ? const BackButton()
          : Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Image(
                    image: AssetImage("assets/images/yellow-outlined-duck.png"),
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
          : Text(widget.title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white)),
      actions: _buildActions(),
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
        onSubmitted: (query) => {updateMap(query)});
  }

  List<Widget> _buildActions() {
    if (_isSearching) {
      return <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            updateMap(_searchQueryController.text);
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

  Future<LatLng> getNewCoords(query) async {
    var endpoint =
        "http://www.mapquestapi.com/geocoding/v1/address?key=sBXuSrgDvcOn3QL7oBhOAVvFLARqWxvp&location=$query";
    try {
      final response = await http.get(Uri.parse(endpoint));
      if (response.statusCode == 200) {
        var responseObj = jsonDecode(response.body);
        var latLngObj = responseObj["results"][0]['locations'][0]['latLng'];
        var newLat = latLngObj['lat'];
        var newLng = latLngObj['lng'];
        LatLng newCoords = LatLng(newLat, newLng);
        return newCoords;
      } else {
        throw Exception();
      }
    } catch (error) {
      print(error);
      throw Exception();
    }
  }

  Future updateMap(query) async {
    var newCoords = await getNewCoords(query);
    globalKey.currentState?.changeMapPosition(newCoords);
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
