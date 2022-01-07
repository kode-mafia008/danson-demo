import 'package:flutter/material.dart';
import 'package:vidyalayas/config/palette.dart';
import 'package:vidyalayas/screens/onboard_screen.dart';
import 'package:vidyalayas/user_preferences/user_preferences.dart';
import 'main_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash-screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isLoggedIn = false;

  @override
  void initState() {
    UserPreferences.isLoggedIn().then((value) {
      setState(() {
        isLoggedIn = value;
      });
      if (isLoggedIn) {
        Navigator.pushReplacementNamed(context, MainScreen.id);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardScreen.id);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Palette.purple,
            child: Image.asset('images/background.png'),
          ),
          Container(
            color: Palette.purple.withOpacity(0.83),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 244,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(67),
                image: DecorationImage(
                  image: AssetImage(
                    'images/logo.png',
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
