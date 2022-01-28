import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:selec7/controller/app_controller.dart';

import 'package:selec7/widgets/footer.dart';

import 'package:selec7/widgets/index.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AppController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme:
              const IconThemeData(color: Color.fromRGBO(88, 88, 238, 1.0)),
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
            const MainBanner(),

            Container(
              height: 50.0,
              child: const TabBar(
                indicatorColor: Colors.black,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16.0,
                ),
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                tabs: [
                  Text(
                    "메인",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "상품검색",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "즐겨찾기",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
            // const MenuTaps(),

            Container(
              height: 2074,
              child: TabBarView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // height: 55.0,
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          top: 15.0,
                          bottom: 10.0,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              color: Colors.grey[300]!,
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: const Text(
                          "방금 이거 샀어요!",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const BuyProduct(),
                      // Popular Product(title)
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
                      const PopularProduct(),

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

                      const SubBanner(),
                      const MarketInfo(),
                      const Footer(),
                    ],
                  ),
                  // Icon(Icons.directions_car),
                  const Icon(Icons.directions_transit),
                  const Icon(Icons.directions_bike),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Text("Login"),
          backgroundColor: const Color.fromRGBO(88, 88, 238, 1.0),
        ),
      ),
    );
  }
}
