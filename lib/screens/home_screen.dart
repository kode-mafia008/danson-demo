import 'package:flutter/material.dart';
import 'package:vidyalayas/widgets/header.dart';
import 'package:vidyalayas/widgets/list_tile.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home-screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String imageUrl =
      'https://images.pexels.com/photos/163036/mario-luigi-yoschi-figures-163036.jpeg?cs=srgb&dl=pexels-pixabay-163036.jpg&fm=jpg';

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
                    Text(
                      'Featured Games',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MnB',
                      ),
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
                          return Container(
                            child: Image.asset(
                              'images/header_left.png',
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: topSize * 0.15,
                    ),
                    Text(
                      'Continue Playing',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MnB',
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 5,
                          bottom: 5,
                        ),
                        child: Image.network(
                          imageUrl,
                          height: 170,
                          width: size.width - topSize,
                        ),
                      ),
                    ),
                    Text(
                      'Continue Quizzes',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'MnB',
                      ),
                    ),
                    ListViewTile(),
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
