import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
