import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class SubBanner extends StatefulWidget {
  const SubBanner({Key? key}) : super(key: key);

  @override
  _SubBannerState createState() => _SubBannerState();
}

class _SubBannerState extends State<SubBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              Image.network(
                "https://static2.selec7.com/img/seller_site_thum_img/main-slide4.png",
                fit: BoxFit.fill,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text(
                        '내 쇼핑 도와줄',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "#취향 필요하다면?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        "#셀렉트 하세요",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
        itemCount: 3,
      ),
    );
  }
}
