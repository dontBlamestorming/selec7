import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:selec7/constants/index.dart';
import 'package:selec7/controller/app_controller.dart';

void main() {
  Get.put(AppController());
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: AppRoutes.routes,
    );
  }
}
