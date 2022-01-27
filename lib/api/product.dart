import 'dart:convert';
import 'package:selec7/models/index.dart';
import 'package:http/http.dart' as http;

Future<Store> getData() async {
  var url = Uri.http('selec7.com', '/publish/loadJson');
  var response = await http.get(url);

  if (response.statusCode == 200) {
    return Store.fromJson(json.decode(response.body));
  } else {
    throw Exception("Failed to load data");
  }
}
