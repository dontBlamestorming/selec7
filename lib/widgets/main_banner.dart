import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:selec7/controller/index.dart';
import 'package:selec7/models/index.dart';

class MainBanner extends StatefulWidget {
  const MainBanner({Key? key}) : super(key: key);

  @override
  _MainBannerState createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> {
  late Future<Store> store;

  @override
  void initState() {
    super.initState();
    store = AppController().getData();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 285.0,
      child: FutureBuilder<Store>(
        future: store,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          if (snapshot.hasData) {
            return Swiper(
              itemBuilder: (BuildContext context, int index) {
                String imageLink =
                    "https://img.selec7.com/${snapshot.data?.newItems?[index].siteGalleryRoot}/${snapshot.data?.newItems?[index].productImgInfo}";

                return Stack(
                  children: <Widget>[
                    SizedBox(
                      height: 285.0,
                      width: 412.0,
                      child: Image.network(
                        imageLink,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    SizedBox(
                      height: 285.0,
                      width: 412.0,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20.0, bottom: 20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 90.0,
                              width: 200.0,
                              decoration: BoxDecoration(
                                color: const Color.fromRGBO(0, 0, 0, 0.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      "${snapshot.data?.newItems?[index].siteName}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                    Text(
                                      "${snapshot.data?.newItems?[index].title}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "${snapshot.data?.newItems?[index].subTitle}",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.0,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: snapshot.data!.newItems!.length,
              autoplay: true,
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
