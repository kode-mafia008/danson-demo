import 'package:flutter/material.dart';

import 'package:vidyalayas/config/palette.dart';

class AboutContainer extends StatefulWidget {
  final String address;
  final String phone;
  final String date;
  final String email;

  const AboutContainer({
    Key? key,
    required this.address,
    required this.phone,
    required this.date,
    required this.email,
  }) : super(key: key);

  @override
  _AboutContainerState createState() => _AboutContainerState();
}

class _AboutContainerState extends State<AboutContainer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topSize = MediaQuery.of(context).padding.top;

    return Container(
      width: size.width - topSize,
      margin: EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.location_city_rounded,
                    color: Palette.purple,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(widget.address, overflow: TextOverflow.ellipsis),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.email_outlined,
                    color: Palette.purple,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(widget.email, overflow: TextOverflow.ellipsis),
                ],
              ),
            ],
          ),
          //line between the columns
          Container(
            height: 55,
            width: 5,
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: Palette.black,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          //2nd column
          Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.phone,
                    color: Palette.purple,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(widget.phone, overflow: TextOverflow.ellipsis),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.date_range_rounded,
                    color: Palette.purple,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(widget.date, overflow: TextOverflow.ellipsis),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
