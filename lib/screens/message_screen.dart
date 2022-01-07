import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vidyalayas/config/palette.dart';
import 'package:vidyalayas/modals/user_model.dart';
import 'package:vidyalayas/screens/test_screen.dart';
import 'package:vidyalayas/services/api_services.dart';
import 'package:vidyalayas/widgets/about_container.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MessageScreen extends StatefulWidget {
  static const String id = 'home-screen';
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final String email = 'erus008@gmail.com';
  final String phone = '0123456789';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topSize = MediaQuery.of(context).padding.top;
    final token =
        '0fcbV0&9CB&}C98D668e63bb2a4df08c707)80.1.9=9*2563e527fdb06c8358d';

    return Scaffold(
        backgroundColor: Palette.background.withOpacity(0.95),
        body: Center(
          child: ElevatedButton(
            child: Text('Play Game'),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final json = prefs.getString('login_details') ?? "nothing";
              final data = jsonDecode(json);
              ApiServices.getGameInfo(token: data['token']).then((value) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestScreen(
                              url: value.gameFile,
                            )));
              });
            },
          ),
        ));
  }
}
