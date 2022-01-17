import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:selec7/constants/index.dart';

void main() => {runApp(const App())};

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      getPages: AppRoutes.routes,
    );
  }
}
