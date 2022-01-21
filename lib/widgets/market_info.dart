import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class MarketInfo extends StatefulWidget {
  const MarketInfo({Key? key}) : super(key: key);

  @override
  _MarketInfoState createState() => _MarketInfoState();
}

class _MarketInfoState extends State<MarketInfo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 30.0),
      child: Column(
        children: <Widget>[
          // title
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                // left
                Row(
                  children: [
                    Icon(Icons.access_alarm),
                    Text("박양부띠끄"),
                  ],
                ),

                // right
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.zoom_out_map_outlined),
                      padding: EdgeInsets.all(3.0),
                      constraints: BoxConstraints(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.zoom_out_map_outlined),
                      padding: EdgeInsets.all(3.0),
                      constraints: BoxConstraints(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.zoom_out_map_outlined),
                      padding: EdgeInsets.all(3.0),
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // info of store
          Container(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Row(
              children: const <Widget>[
                Text(
                  "상품 537 | ",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  "최근 일주일 ",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  " 방문 827 | ",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  "구매 6",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
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
              children: const <Widget>[
                Text(
                  "방구석 공주님들을 위해",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "이웃나라 물건들을 찾아오는 집콕공주",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  "나도 집에선 공주얌",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // product
          Container(
            padding: const EdgeInsets.only(top: 15.0),
            height: 200.0,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      child: Image.network(
                        "https://picsum.photos/250/150",
                        fit: BoxFit.fill,
                      ),
                    ),
                    const Text(
                      "자연광에 대박나는 원피스 잠옷",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    const Text(
                      "롱롱 기장이지만 앞트임이 있어서 활동하기 불편하지 않아요",
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                    ),
                    Row(
                      children: const <Widget>[
                        Icon(Icons.account_box_outlined),
                        Text("1"),
                        Icon(Icons.account_box_outlined),
                        Text("1"),
                        Icon(Icons.account_box_outlined),
                      ],
                    ),
                  ],
                );
              },
              itemCount: 3,
              viewportFraction: 0.9,
              scale: 1,
              loop: false,
            ),
          ),
        ],
      ),
    );
  }
}
