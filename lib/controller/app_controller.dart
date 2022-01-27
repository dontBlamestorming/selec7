import 'package:get/get.dart';
import 'package:selec7/models/index.dart';
import 'package:selec7/api/index.dart';

class AppController extends GetxController {
  late Future<Store> store = getData();
}
