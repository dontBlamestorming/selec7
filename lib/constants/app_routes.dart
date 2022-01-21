import 'package:get/get.dart';

import 'package:selec7/pages/index.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(name: '/', page: () => const Home()),
  ];
}
