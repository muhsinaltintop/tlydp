import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  final String url = "https://tlydp.herokuapp.com/api/";
  Map<String, String> setHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future fetchData(endpoint) async {
    // ducks?maker_id=$makerId
    // ducks/found?finder_id=$finderId
    var fullUrl = url + endpoint;
    try {
      return await http.post(
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
}
