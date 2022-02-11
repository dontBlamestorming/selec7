import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:selec7/controller/index.dart';
import 'package:selec7/models/index.dart';

import 'package:get/get.dart';

class MainBanner extends StatefulWidget {
  const MainBanner({Key? key}) : super(key: key);

  @override
  _MainBannerState createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> {
  late Future<Store> store;

  @override
  Widget build(BuildContext _) {
    AppController controller = Get.find();
    double screenWidth = MediaQuery.of(_).size.width;
    double screenHeight = MediaQuery.of(_).size.height;

    return SizedBox(
      width: screenWidth,
      height: screenHeight * 0.417,
      child: FutureBuilder<Store>(
        future: controller.store,
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          if (snapshot.hasData) {
            return Swiper(
              itemBuilder: (BuildContext _, int index) {
                String imageLink =
                    "https://img.selec7.com/${snapshot.data?.newItems?[index].siteGalleryRoot}/${snapshot.data?.newItems?[index].productImgInfo}";

                return Stack(
                  children: <Widget>[
                    SizedBox.expand(
                      child: Image.network(
                        imageLink,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      bottom: 20.0,
                      child: SizedBox(
                        width: screenWidth,
                        child: FractionallySizedBox(
                          widthFactor: 0.7,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(0, 0, 0, 0.5),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${snapshot.data?.newItems?[index].siteName}",
                                    ),
                                    Text(
                                      "${snapshot.data?.newItems?[index].title}",
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${snapshot.data?.newItems?[index].subTitle}",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: snapshot.data!.newItems!.length,
              autoplay: false,
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
