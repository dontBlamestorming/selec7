import 'package:flutter/material.dart';

import 'package:card_swiper/card_swiper.dart';

class BuyProduct extends StatefulWidget {
  const BuyProduct({Key? key}) : super(key: key);

  @override
  _BuyProductState createState() => _BuyProductState();
}

class _BuyProductState extends State<BuyProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
