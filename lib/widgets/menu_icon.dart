import 'package:flutter/material.dart';

class MenuIcon extends StatefulWidget {
  const MenuIcon({Key? key}) : super(key: key);

  @override
  _MenuIconState createState() => _MenuIconState();
}

class _MenuIconState extends State<MenuIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 5,
          width: 27,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Container(
          height: 5,
          width: 33,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(
          height: 3,
        ),
        Container(
          height: 5,
          width: 27,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ],
    );
  }
}
