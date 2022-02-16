import 'dart:ui';

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

  Widget _popularProductCard(BuildContext context, product) {
    String imageLink =
        "https://img.selec7.com/${product.siteGalleryRoot}/${product.productImgInfo}";

    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 14.0,
          top: 8.0,
          right: 14.0,
          bottom: 8.0,
        ),
        child: Row(
          children: [
            Flexible(
              child: ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(30),
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 0.4, sigmaY: 0.4),
                    child: Image.network(
                      imageLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              flex: 1,
            ),
            const SizedBox(
              width: 15.0,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${product.siteName}",
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${product.title}",
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w900,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${product.subTitle}",
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    "${product.price} | 누적구매 ${product.soldCount}개",
                    style: const TextStyle(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w300,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Store>(
      future: controller.store,
      builder: (_, snapshot) {
        if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        if (snapshot.hasData) {
          List items = snapshot.data!.popularItems!.toList();

          if (!controller.isExpandedPopularList.value) {
            items = items.sublist(0, 5);
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 15.0,
                  bottom: 10.0,
                ),
                child: const Text(
                  "요즘은 이게 인기",
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListBody(
                        children: items
                            .map((item) => _popularProductCard(_, item))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      child: const Icon(
                        Icons.add,
                        color: Colors.grey,
                        size: 18.0,
                      ),
                      onPressed: () {
                        controller.isExpandedPopularList.value =
                            !controller.isExpandedPopularList.value;
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(5),
                        primary: Colors.white,
                        elevation: 1.0,
                      ),
                    ),
                  ],
                ),
              ),
            ],
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
