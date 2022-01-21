import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

import 'package:selec7/controller/index.dart';
import 'package:selec7/models/index.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Store> store;
  final List<bool> _isSelects = List.generate(3, (index) => false);

  @override
  void initState() {
    super.initState();
    store = AppController().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color.fromRGBO(88, 88, 238, 1.0)),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.network(
                  "https://static2.selec7.com/img/seller_site_thum_img/logo.png",
                  width: 120.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    '셀렉트, 내 취향을 팝니다.',
                    style: TextStyle(
                      fontSize: 10.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("로그인을 해주세요!"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: const Text("공지사항 및 이용안내"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: const Text("알림"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("장바구니 내역"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("주문·배송 내역"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            const ListTile(
              title: Text("추천상품"),
            ),
            Stack(
              children: [
                Image.network(
                  "https://picsum.photos/250/150",
                  fit: BoxFit.fill,
                ),
                Container(
                  height: 140.0,
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.only(left: 10.0),
                  child: const Text(
                    "샤베트니트🌈",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              title: const Text("내 웹사이트 관리"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const Divider(
              height: 1,
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.ac_unit_rounded),
                  Text("고객센터"),
                  SizedBox(
                    width: 15.0,
                  ),
                  Icon(Icons.ac_unit_rounded),
                  Text("로그인"),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: ListView(
        children: <Widget>[
          // Main Banner
          SizedBox(
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
                              padding: const EdgeInsets.only(
                                  left: 20.0, bottom: 20.0),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
          ),

          // Taps
          Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ToggleButtons(
                  children: const <Widget>[
                    Text("메인"),
                    Text("상품"),
                    Text("즐겨찾기"),
                  ],
                  constraints: BoxConstraints(
                    minWidth: (MediaQuery.of(context).size.width - 4) / 3,
                    minHeight: (MediaQuery.of(context).size.height - 4),
                  ),
                  onPressed: (int index) {
                    // Not working
                    // setState(() {
                    //   _isSelects[index] = !_isSelects[index];
                    // });
                  },
                  isSelected: _isSelects,
                  selectedColor: Colors.redAccent,
                  renderBorder: false,
                )
              ],
            ),
          ),

          // Buying Product(title)
          Container(
            height: 50.0,
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 15.0,
              bottom: 15.0,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey[300]!,
                  width: 1.0,
                ),
              ),
            ),
            child: const Text("방금 이거 샀어요!"),
          ),

          // Buying Product(Card)
          Container(
            height: 110.0,
            child: Swiper(
              itemBuilder: (context, index) {
                return Container(
                  child: Card(
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Container(
                      width: 300.0,
                      // height: 80.0,
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.network(
                            "https://picsum.photos/250/150",
                            fit: BoxFit.fill,
                          ),
                          Column(
                            children: const <Widget>[
                              Text('Name'),
                              Text('Description'),
                              Text('Price'),
                              Text('Recod'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: 3,
              viewportFraction: 0.9,
              scale: 1,
              loop: false,
            ),
          ),

          // Popular Product(title)
          Container(
            height: 50.0,
            padding: const EdgeInsets.only(
              left: 15.0,
              top: 15.0,
              bottom: 15.0,
            ),
            child: const Text("요즘은 이게 인기"),
          ),

          // Popular Product
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                children: [
                  Flexible(
                    child: Image.network(
                      "https://picsum.photos/250/150",
                      fit: BoxFit.fill,
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    child: Column(
                      children: const <Widget>[
                        Text("Name"),
                        Text("Title"),
                        Text("Description"),
                        Text("Price | Number of Sales"),
                      ],
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                children: [
                  Flexible(
                    child: Image.network(
                      "https://picsum.photos/250/150",
                      fit: BoxFit.fill,
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    child: Column(
                      children: const <Widget>[
                        Text("Name"),
                        Text("Title"),
                        Text("Description"),
                        Text("Price | Number of Sales"),
                      ],
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                children: [
                  Flexible(
                    child: Image.network(
                      "https://picsum.photos/250/150",
                      fit: BoxFit.fill,
                    ),
                    flex: 1,
                  ),
                  Flexible(
                    child: Column(
                      children: const <Widget>[
                        Text("Name"),
                        Text("Title"),
                        Text("Description"),
                        Text("Price | Number of Sales"),
                      ],
                    ),
                    flex: 3,
                  ),
                ],
              ),
            ),
          ),

          // Popular Product(Arrow)
          ElevatedButton(
            child: const Icon(Icons.arrow_circle_down),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(5),
            ),
          ),

          // Sub Banner
          Container(
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
          ),

          // Markets
          Padding(
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
          ),

          // footer(consider bottom property or body property)
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    "(주)텐스 | info@tenthinc.com",
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                  const Text(
                    "대표: 김철형 | 사업자등록번호: 828-88-00992",
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                  const Text(
                    "통신판매업신고: 2019-서울강남-03168호",
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                  const Text(
                    "주소: 서울시 강남구 테헤란로 79길 25-1 3층(삼성동)",
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                  const Text(
                    "전화: 02-563-1271 | 팩스: 02-564-1271",
                    style: TextStyle(
                      fontSize: 11.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 15.0, bottom: 10.0),
                    child: Text(
                      "©Tenth Inc. All Rights Reserved.",
                      style: TextStyle(
                        fontSize: 11.0,
                      ),
                    ),
                  ),
                  Image.network(
                    "https://static2.selec7.com/img/seller_site_thum_img/logo.png",
                    width: 60.0,
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Text("Login"),
        backgroundColor: Color.fromRGBO(88, 88, 238, 1.0),
      ),
    );
  }
}

  // body: FutureBuilder<Store>(
  //   future: store,
  //   builder: (context, snapshot) {
  //     if (snapshot.hasData) {
  //       return Text('${snapshot.data?.newItems?[1].price}');
  //     } else if (snapshot.hasError) {
  //       return Text("${snapshot.error}");
  //     }

  //     return CircularProgressIndicator();
  //   },
  // ),