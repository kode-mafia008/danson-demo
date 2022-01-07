import 'package:flutter/material.dart';
import 'config/palette.dart';
import 'screens/home_screen.dart';
import 'screens/main_screen.dart';
import 'screens/login_screen.dart';
import 'screens/onboard_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/test_screen.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Danson Demo',
      theme: ThemeData(
        primaryColor: Palette.purple,
        fontFamily: Cfont.R,
      ),
      initialRoute: SplashScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        MainScreen.id: (context) => MainScreen(),
        OnBoardScreen.id: (context) => OnBoardScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        TestScreen.id: (context) => TestScreen(url: '',),
      },
      home: SplashScreen(),
    );
  }
}
