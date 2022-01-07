import 'package:flutter/painting.dart';

class Palette {
  static const Color background = Color(0xFFe5e5e5);
  static const Color purple = Color(0xFF7C21EF);
  static const Color grey = Color(0xFF404251);
  static const Color orange = Color(0xFFFFC727);
  static const Color black = Color(0xFF000000);
  static const Color bgTextFieldText = Color(0xFFADADAD);
  static const Color bgTextField = Color(0xFFF2F2F2);
  static const Color searchFieldText = Color(0xFF8F8F8F);
  static const Color searchField = Color(0xFFF0F0F0);
  static const Color white = Color(0xFFffffff);
}

class Cfont {
  static const String R = 'MnR';
  static const String L = 'MnL';
  static const String Xb = 'MnXb';
  static const String B = 'MnB';
}

class Style {
  static const onboardRStyle = TextStyle(fontFamily: 'MnR', fontSize: 14);
    static const searchFieldStyle = TextStyle(fontFamily: 'MnR', fontSize: 14, color: Palette.searchFieldText);
  static const onboardBStyle = TextStyle(fontFamily: 'MnB', fontSize: 14);
  static const onboardB20Style = TextStyle(fontFamily: 'MnB', fontSize: 20);
  static const onboardXbStyle = TextStyle(fontFamily: 'MnXb', fontSize: 14);
  static const onboardLStyle = TextStyle(fontFamily: 'MnL', fontSize: 14);
  static const RStyle = TextStyle(fontFamily: 'MnR', fontSize: 14);
  static const BStyle = TextStyle(fontFamily: 'MnB', fontSize: 14);
  static const LStyle = TextStyle(fontFamily: 'MnL', fontSize: 14);
  static const XbStyle = TextStyle(fontFamily: 'MnXb', fontSize: 14);
  static const headerXBStyle = TextStyle(
    fontFamily: 'MnXb',
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Palette.purple,
  );

  static const headerRStyle = TextStyle(
    fontFamily: 'MnL',
    fontSize: 14,
    letterSpacing: 0.5,
    fontWeight: FontWeight.bold,
    color: Palette.purple,
  );

  static const Xb1sStyle =
      TextStyle(fontFamily: 'MnXb', fontSize: 17, letterSpacing: 1);
}
