import 'package:get/get.dart';

import 'package:selec7/pages/index.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GetPage(name: '/', page: () => const Home(title: '셀렉트, 내 취향을 팝니다.')),
  ];
}
