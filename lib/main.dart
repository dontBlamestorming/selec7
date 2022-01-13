import 'package:flutter/material.dart';

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
              child: const Center(
                child: Text("Main Banner"),
              ),
            ),

            // Taps
            Container(
              height: 50.0,
              color: Colors.amber[500],
              child: const Center(
                child: Text("Taps"),
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
