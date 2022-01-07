import 'package:flutter/material.dart';
import 'package:vidyalayas/config/palette.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  var _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double topSize = MediaQuery.of(context).padding.top;
    return Positioned(
      top: topSize * 2,
      left: 10,
      right: 10,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ChimpVine',
                    style: Style.headerXBStyle,
                  ),
                  Text(
                    'Make Learning Fun',
                    style: Style.headerRStyle,
                  ),
                ],
              ),
              Image.asset(
                'images/header_left.png',
                height: 50,
              )
            ],
          ),
          SizedBox(
            height: topSize * 2.2,
          ),
          //search bar
          Container(
              margin: EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Palette.searchField,
              ),
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search for games, quizzes & resources',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Palette.searchFieldText,
                  ),
                ),
              )),
          //end of search bar
        ],
      ),
    );
  }
}
