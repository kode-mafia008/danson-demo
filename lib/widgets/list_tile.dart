import 'package:flutter/material.dart';
import 'package:vidyalayas/config/palette.dart';

class ListViewTile extends StatefulWidget {
  const ListViewTile({Key? key}) : super(key: key);

  @override
  _ListViewTileState createState() => _ListViewTileState();
}

class _ListViewTileState extends State<ListViewTile> {
  final String imageUrl =
      'https://images.pexels.com/photos/163036/mario-luigi-yoschi-figures-163036.jpeg?cs=srgb&dl=pexels-pixabay-163036.jpg&fm=jpg';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double topSize = MediaQuery.of(context).padding.top;
    return Container(
        height: 80,
        width: size.width - topSize * 1.1,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Palette.purple,
          // image: DecorationImage(
          //     image: NetworkImage(
          //       imageUrl,
          //     ),
          //     fit: BoxFit.cover),
        ),
        child: ListTile(
          leading: Image.asset('images/game_icon.png'),
          title: Text(
            "Learn how to count 5",
            style: TextStyle(
              color: Palette.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'MnB',
            ),
          ),
          subtitle: Text(
            '5 minutes read',
            style: TextStyle(
              color: Palette.searchFieldText,
            ),
          ),
        ));
  }
}
