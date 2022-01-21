import 'package:flutter/material.dart';

class PopularProduct extends StatefulWidget {
  const PopularProduct({Key? key}) : super(key: key);

  @override
  _PopularProductState createState() => _PopularProductState();
}

class _PopularProductState extends State<PopularProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
