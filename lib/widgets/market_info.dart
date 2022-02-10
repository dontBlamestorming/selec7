import 'package:flutter/material.dart';

import 'package:selec7/models/index.dart';

import 'package:card_swiper/card_swiper.dart';
import 'package:selec7/controller/app_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MarketInfo extends StatefulWidget {
  const MarketInfo({Key? key}) : super(key: key);

  @override
  _MarketInfoState createState() => _MarketInfoState();
}

class _MarketInfoState extends State<MarketInfo> {
  AppController controller = Get.find();

  Widget _productCardSwiper(BuildContext _, data) {
    int lengthOfDtoList = 0;

    if (data.dtoList?.length != null) {
      lengthOfDtoList = data.dtoList!.length;
    }

    return Swiper(
      index: 1,
      itemBuilder: (BuildContext context, int index) {
        String imageLink =
            "https://img.selec7.com/${data.dtoList?[index].siteGalleryRoot}/${data.dtoList?[index].productImgInfo?[0].fileNameChange}";
        bool? hasLike = data.dtoList?[index].likeBoolean;
        bool? hasComment = data.dtoList?[index].commentBoolean;
        bool? hasShareCount = data.dtoList?[index].shareBoolean;

        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 110.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                ),
                child: Image.network(
                  imageLink,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 6.0),
              SizedBox(
                width: 110.0,
                child: Text(
                  "${data.dtoList?[index].title}",
                  maxLines: 3,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              SizedBox(
                width: 110.0,
                child: Text(
                  "${data.dtoList?[index].subTitle}",
                  maxLines: 4,
                  style: const TextStyle(
                    fontSize: 12.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 6.0),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/heart-fill.svg',
                      width: 12.0,
                      color: Colors.red,
                    ),
                    padding: const EdgeInsets.only(right: 1.0),
                    constraints: const BoxConstraints(),
                  ),
                  if (hasLike != null && hasLike)
                    Text("${data.dtoList?[index].likeCount}"),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/reply.svg',
                      width: 12.0,
                    ),
                    padding: const EdgeInsets.only(right: 1.0),
                    constraints: const BoxConstraints(),
                  ),
                  if (hasComment != null && hasComment)
                    Text("${data.dtoList?[index].commentCount}"),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      'assets/icons/share.svg',
                      width: 12.0,
                    ),
                    padding: const EdgeInsets.only(right: 1.0),
                    constraints: const BoxConstraints(),
                  ),
                  if (hasShareCount != null && hasShareCount)
                    Text("${data.dtoList?[index].shareCount}"),
                ],
              ),
            ],
          ),
        );
      },
      itemCount: lengthOfDtoList - 1,
      viewportFraction: 0.36,
      scale: 1,
      loop: false,
    );
  }

  Widget _marketCard(BuildContext _, data) {
    bool? hasShareCount = data.scoreBoardShareBool;
    bool? hasSaleCount = data.scoreBoardSaleBool;

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16.0),
            bottomLeft: Radius.circular(16.0),
          ),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 22.0, bottom: 20.0),
          child: Column(
            children: <Widget>[
              // title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // left
                  Row(
                    children: [
                      SizedBox(
                        width: 26.0,
                        child: Image.network('${data.faviconRoot}'),
                      ),
                      Text(
                        '${data.storeName}',
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  // right
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/insta.svg',
                            width: 20.0,
                          ),
                          padding: const EdgeInsets.all(2.0),
                          constraints: const BoxConstraints(),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/share.svg',
                            width: 20.0,
                          ),
                          padding: const EdgeInsets.all(2.0),
                          constraints: const BoxConstraints(),
                        ),
                        const SizedBox(
                          width: 8.0,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/start.svg',
                            width: 20.0,
                          ),
                          padding: const EdgeInsets.all(2.0),
                          constraints: const BoxConstraints(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // info of store
              Container(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      '상품 ${data.allCount} | ',
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    Text(
                      "최근 일주일 방문 ${data.scoreBoardVisitorCount} | ",
                      style: const TextStyle(fontSize: 12.0),
                    ),
                    if (hasShareCount != null && hasShareCount)
                      Text(
                        "공유 ${data.scoreBoardShareCount} | ",
                        style: const TextStyle(fontSize: 12.0),
                      ),
                    if (hasSaleCount != null && hasSaleCount)
                      Text(
                        "구매 ${data.scoreBoardSaleCount}",
                        style: const TextStyle(fontSize: 12.0),
                      ),
                  ],
                ),
              ),

              // desc of store
              Container(
                padding: const EdgeInsets.only(
                  top: 10.0,
                ),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${data.storeDescriptionOriginal}",
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              // product
              Container(
                padding: const EdgeInsets.only(top: 16.0),
                height: 300.0,
                child: _productCardSwiper(_, data),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 28.0),
      child: FutureBuilder<Store>(
        future: controller.store,
        builder: (_, snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          if (snapshot.hasData) {
            List items = snapshot.data!.markets!.marketList!.toList();
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListBody(
                    children:
                        items.map((item) => _marketCard(_, item)).toList(),
                  )
                ],
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
      ),
    );
  }
}
