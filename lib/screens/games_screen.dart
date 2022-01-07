import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vidyalayas/config/palette.dart';
import 'package:vidyalayas/widgets/header.dart';
import 'package:vidyalayas/widgets/list_tile.dart';

class GamesScreen extends StatelessWidget {
  static const String id = 'home-screen';
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topSize = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Header(),
              Positioned(
                top: size.height * 0.3,
                left: topSize * 0.65,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: topSize * 0.15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Filter By:',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: Cfont.Xb,
                              letterSpacing: 0.5),
                        ),
                        SizedBox(
                          width: size.width * 0.65,
                        ),
                        Icon(CommunityMaterialIcons.filter_menu),
                      ],
                    ),
                    SizedBox(
                      height: topSize * 0.15,
                    ),
                    SizedBox(
                      height: 100,
                      width: size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(
                                  'images/game_icon.png',
                                  height: 70,
                                ),
                              ),
                              Text('Maths'),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: topSize * 0.15,
                    ),
                    Text(
                      'Subjects',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        fontFamily: Cfont.Xb,
                        letterSpacing: 0.5,
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      width: size.width,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Image.asset(
                                  'images/game_icon.png',
                                  height: 70,
                                ),
                              ),
                              Text('Maths'),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'All Games',
                          style: Style.Xb1sStyle,
                        ),
                        Row(
                          children: [
                            Text('Maths', style: Style.BStyle),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                CommunityMaterialIcons.filter_menu,
                                color: Palette.orange,
                              ),
                            ),
                          ],
                        ),
                        ListViewTile(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
