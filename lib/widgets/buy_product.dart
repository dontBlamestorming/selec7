import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:selec7/controller/index.dart';
import 'package:selec7/models/index.dart';

class BuyProduct extends StatefulWidget {
  const BuyProduct({Key? key}) : super(key: key);

  @override
  _BuyProductState createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {
  AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.0,
      child: FutureBuilder<Store>(
        future: controller.store,
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          if (snapshot.hasData) {
            return Swiper(
              itemBuilder: (context, index) {
                String imageLink =
                    "https://img.selec7.com/${snapshot.data?.recentSoldItems?[index].siteGalleryRoot}/${snapshot.data?.recentSoldItems?[index].productImgInfo}";

                return Container(
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            height: 80.0,
                            width: 80.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                imageLink,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 15.0,
                          ),
                          Container(
                            height: 80.0,
                            width: 200.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${snapshot.data?.recentSoldItems?[index].siteName}",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${snapshot.data?.recentSoldItems?[index].title}",
                                  style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${snapshot.data?.recentSoldItems?[index].price}",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${snapshot.data?.recentSoldItems?[index].message}",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: snapshot.data!.recentSoldItems!.length,
              viewportFraction: 0.9,
              scale: 1,
              loop: false,
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
      ),
    );
  }
}
