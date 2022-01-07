import 'package:flutter/material.dart';

import 'package:vidyalayas/config/palette.dart';

class ListViewerIcon extends StatefulWidget {
  final String heading;
  final String subheading;
  final Icon icon;
  final String btnText;
  const ListViewerIcon({
    Key? key,
    required this.heading,
    required this.subheading,
    required this.icon,
    required this.btnText,
  }) : super(key: key);

  @override
  _ListViewerIconState createState() => _ListViewerIconState();
}

class _ListViewerIconState extends State<ListViewerIcon> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topSize = MediaQuery.of(context).padding.top;
    return Container(
      height: 100,
      width: size.width - topSize,
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          widget.icon,
          SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.heading,
                style: Style.XbStyle,
              ),
              Text(
                widget.subheading,
                maxLines: 1,
              )
            ],
          ),
          SizedBox(
            width: 15,
          ),
          //view details button
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: 75,
            height: 25,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  widget.btnText,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
