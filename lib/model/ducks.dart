import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'ducks.g.dart';

@JsonSerializable()
class Duck {
  final int duck_id;
  final String duck_name;
  final int? maker_id;
  final int? finder_id;
  final double? location_found_lat;
  final double? location_found_lng;
  final double? location_placed_lat;
  final double? location_placed_lng;
  final String? clue;
  final String? image;
  final String? comments;
  final String maker_name;
  final String? finder_name;

  const Duck({
    required this.duck_id,
    required this.duck_name,
    this.maker_id,
    this.finder_id,
    this.location_found_lat,
    this.location_found_lng,
    this.location_placed_lat,
    this.location_placed_lng,
    this.clue,
    this.image,
    this.comments,
    required this.maker_name,
    this.finder_name,
  });

  factory Duck.fromJson(Map<String, dynamic> json) {
    return Duck(
      duck_id: json['duck_id'],
      duck_name: json['duck_name'],
      maker_id: json['maker_id'],
      finder_id: json['finder_id'],
      location_found_lat: json['location_found_lat'],
      location_found_lng: json['location_found_lng'],
      location_placed_lat: json['location_placed_lat'],
      location_placed_lng: json['location_placed_lng'],
      clue: json['clue'],
      image: json['image'],
      comments: json['comments'],
      maker_name: json['maker_name'],
      finder_name: json['finder_name'],
    );
  }
}

Future<List<Duck>> getFoundDucks(String query) async {
  var ducksURL = query == 'All'
      ? "https://tlydp.herokuapp.com/api/ducks"
      : "https://tlydp.herokuapp.com/api/ducks/$query";

  try {
    final response = await http.get(Uri.parse(ducksURL));
    if (response.statusCode == 200) {
      var allDucks = List.from(json.decode(response.body)['ducks']);

      return allDucks.map((e) => Duck.fromJson(e)).toList();
    } else {
      throw Exception();
    }
  } catch (error) {
    print(error);
    throw Exception();
  }

  // return Duck.fromJson(json.decode(
  //   await rootBundle.loadString('../../assets/foundDucks.json'),
  // ));
}
