import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:vidyalayas/config/palette.dart';
import 'login_screen.dart';

class OnBoardScreen extends StatefulWidget {
  static const String id = 'onboard-screen';
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

final _controller = PageController(
  initialPage: 0,
);

int _currentPage = 0;
double gap = 40;
late double topsize;

List<Widget> _pages = [
  Container(
    margin: EdgeInsets.only(top: topsize + 20, left: topsize * 0.7),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'images/makelearning.png',
          height: 300.54,
          width: 300.54,
        ),
        SizedBox(
          height: gap,
        ),
        Text(
          'ChimpVine',
          style: TextStyle(fontSize: 22),
        ),
        Text(
          'Make Learning',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: Cfont.Xb),
        ),
        Text(
          'Fun',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: Cfont.Xb),
        ),
      ],
    ),
  ),
  Container(
    margin: EdgeInsets.only(top: topsize + 20, left: topsize * 0.7),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'images/educational_games.png',
          height: 300.54,
          width: 300.54,
        ),
        SizedBox(
          height: gap,
        ),
        Text(
          'ChimpVine',
          style: TextStyle(fontSize: 22),
        ),
        Text(
          '200+ Educational ',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: Cfont.Xb),
        ),
        Text(
          'Games',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: Cfont.Xb),
        ),
      ],
    ),
  ),
  Container(
    margin: EdgeInsets.only(top: topsize + 20, left: topsize * 0.7),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          'images/quizes_resources.png',
          height: 300.54,
          width: 300.54,
        ),
        SizedBox(
          height: gap,
        ),
        Text(
          'ChimpVine',
          style: TextStyle(fontSize: 22),
        ),
        Text(
          '2000+ Quizzes',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: Cfont.Xb),
        ),
        Text(
          '& Resources',
          style: TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: Cfont.Xb),
        ),
      ],
    ),
  ),
];

class _OnBoardScreenState extends State<OnBoardScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topSize = MediaQuery.of(context).padding.top;
    setState(() {
      topsize = topSize;
    });
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SizedBox(
                height: size.height * 0.15,
              ),
              PageView(
                controller: _controller,
                children: _pages,
                onPageChanged: (index) {
                  setState(
                    () {
                      _currentPage = index;
                    },
                  );
                },
              ),
              Positioned(
                top: (size.height * 0.78),
                left: 10,
                child: Container(
                  child: DotsIndicator(
                    mainAxisAlignment: MainAxisAlignment.start,
                    axis: Axis.horizontal,
                    dotsCount: _pages.length,
                    position: _currentPage.toDouble(),
                    decorator: DotsDecorator(
                      size: const Size.square(10.0),
                      activeSize: const Size(22.0, 12.0),
                      activeShape: CircleBorder(
                        side: BorderSide(
                          color: Palette.black.withOpacity(0.8),
                        ),
                      ),
                      activeColor: Palette.orange,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.82,
                left: topSize * 0.7,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Palette.purple,
                        borderRadius: BorderRadius.circular(35)),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    width: size.width * 0.5,
                    height: 55,
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.9,
                right: 0,
                bottom: 0,
                child: Image.asset(
                  'images/corner.png',
                  scale: 4.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
