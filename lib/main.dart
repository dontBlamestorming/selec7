import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '셀렉트, 내 취향을 팝니다.'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>[
      'Banner',
      'Taps',
      'Buying Product',
      'Popular Product',
      'Sub Banner',
      'Markets'
    ];
    List<bool> _isSelects = List.generate(3, (index) => false);
    print(_isSelects);

    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.network(
                    "https://static2.selec7.com/img/seller_site_thum_img/logo.png",
                    width: 120.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            )
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            // Main Banner
            Container(
              height: 250.0,
              color: Colors.amber[600],
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                    "https://picsum.photos/250/150",
                    fit: BoxFit.fill,
                  );
                },
                itemCount: 3,
              ),
            ),

            // Taps
            Container(
              height: 50.0,
              color: Colors.grey[200],
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
                  )
                ],
              ),
            ),

            // Buying Product
            Container(
              height: 150.0,
              color: Colors.amber[400],
              child: const Center(
                child: Text("Buying Product"),
              ),
            ),

            // Popular Product
            Container(
              height: 800.0,
              color: Colors.amber[300],
              child: const Center(
                child: Text("Popular Product"),
              ),
            ),

            // Sub Banner
            Container(
              height: 200.0,
              color: Colors.amber[200],
              child: const Center(
                child: Text("Sub Banner"),
              ),
            ),

            // Markets
            Container(
              height: 800.0,
              color: Colors.amber[100],
              child: const Center(
                child: Text("Markets"),
              ),
            ),
          ],
        ));
  }
}
