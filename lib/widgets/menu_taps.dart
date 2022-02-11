import 'package:flutter/material.dart';

class MenuTaps extends StatefulWidget {
  const MenuTaps({Key? key}) : super(key: key);

  @override
  _MenuTapsState createState() => _MenuTapsState();
}

class _MenuTapsState extends State<MenuTaps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
      ),
      child: const TabBar(
        indicator: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 2.0,
            ),
          ),
        ),
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        unselectedLabelColor: Colors.black,
        labelColor: Colors.black,
        labelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        tabs: [
          Tab(text: "메인"),
          Tab(text: "상품검색"),
          Tab(text: "즐겨찾기"),
        ],
      ),
    );
  }
}
