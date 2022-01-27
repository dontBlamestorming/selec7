import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:selec7/controller/index.dart';
import 'package:selec7/models/index.dart';

class PopularProduct extends StatefulWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Store>(
      future: controller.store,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        if (snapshot.hasData) {
          final items = snapshot.data!.popularItems!.toList();

          return Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: SingleChildScrollView(
              child: ListBody(
                children: items.map((i) => Text("${i.price}")).toList(),
              ),
            ),
          );
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                CircularProgressIndicator(),
              ],
            ),
          ],
        );
      },
    );
  }
}
// Card(
//                   child: Row(
//                     children: [
//                       Flexible(
//                         child: Image.network(
//                           "https://picsum.photos/250/150",
//                           fit: BoxFit.fill,
//                         ),
//                         flex: 1,
//                       ),
//                       Flexible(
//                         child: Column(
//                           children: const <Widget>[
//                             Text("Name"),
//                             Text("Title"),
//                             Text("Description"),
//                             Text("Price | Number of Sales"),
//                           ],
//                         ),
//                         flex: 3,
//                       ),
//                     ],
//                   ),
//                 ),