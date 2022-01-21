import 'package:flutter/material.dart';

class MenuTaps extends StatefulWidget {
  const MenuTaps({Key? key}) : super(key: key);

  @override
  _MenuTapsState createState() => _MenuTapsState();
}

class _MenuTapsState extends State<MenuTaps> {
  late final List<bool> _isSelects = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
