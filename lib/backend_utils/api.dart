import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class CallApi {
  final String url = "https://tlydp.herokuapp.com/api/users/";
  Map<String, String> setHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  Future postUser(data, endpoint) async {
    var fullUrl = url + endpoint;
    try {
      Response res = await http.post(
        Uri.parse(fullUrl),
        body: jsonEncode(data),
        headers: setHeaders
      );
      print(data);
      print(res);
      return res;
    } catch (e) {
      print(e);
    }
  }
}