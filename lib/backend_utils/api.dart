import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  final String url = "https://tlydp.herokuapp.com/api/";
  Map<String, String> setHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future fetchData(endpoint) async {
    var fullUrl = url + endpoint;
    try {
      return await http.get(
        Uri.parse(fullUrl),
      );
    } catch (e) {
      return e;
    }
  }

  Future postData(data, endpoint) async {
    var fullUrl = url + endpoint;
    try {
      return await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: setHeaders
      );
    } catch (e) {
      return e;
    }
  }

  Future patchData(data, endpoint) async {
    var fullUrl = url + endpoint;
    try {
      return await http.patch(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: setHeaders
      );
    } catch (e) {
      return e;
    }
  }

  Future getData(locationPlacedLat, locationPlacedLng) async {
    http.Response response = await http.get(Uri.parse("https://maps.googleapis.com/maps/api/geocode/json?latlng=$locationPlacedLat,$locationPlacedLng&key=AIzaSyAljGvVbzLZeSMSnZVLiKFixo0i4o8Elfo"));

    try {
      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);
        final location = data["results"][0]["formatted_address"];
        return location;
      } else {
        return "Failed";
      }
    } catch (e) {
      return "Failed";
    }
  }
}


