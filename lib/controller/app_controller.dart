import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:selec7/models/index.dart';
import 'dart:convert';

class AppController extends GetxController {
  var isLoading = true.obs;
  var dataList = <Store>[].obs;

  Future<Store> getData() async {
    var url = Uri.https('selec7.com', '/publish/loadJson');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      return Store.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load data");
    }
  }
}
