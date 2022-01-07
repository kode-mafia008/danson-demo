import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vidyalayas/config/palette.dart';
import 'package:vidyalayas/screens/comments_screen.dart';
import 'package:vidyalayas/screens/games_screen.dart';
import 'package:vidyalayas/screens/message_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'main-screen';


  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _currentScreen = HomeScreen(); 
  int _index = 0;
  final PageStorageBucket _bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: PageStorage(
        child: _currentScreen,
        bucket: _bucket,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(
            bottom: size.height * 0.05,
            left: size.width * 0.05,
            right: size.width * 0.05),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: BottomAppBar(
            notchMargin: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left side of floating button
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      _index = 0;
                      _currentScreen = HomeScreen();
                    });
                  },
                  child: _index == 0
                      ? Container(
                          height: 40,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Palette.purple,
                            borderRadius: BorderRadius.circular(19),
                            shape: BoxShape.rectangle,
                          ),
                          child: Icon(
                            CupertinoIcons.home,
                            color: Colors.white,
                          ))
                      : Container(child: Icon(CupertinoIcons.home)),
                ),

                //games screen
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      _index = 1;
                      _currentScreen = GamesScreen();
                    });
                  },
                  child: _index == 1
                      ? Container(
                          height: 40,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Palette.purple,
                            borderRadius: BorderRadius.circular(19),
                            shape: BoxShape.rectangle,
                          ),
                          child: Icon(
                            CupertinoIcons.game_controller,
                            color: Colors.white,
                          ))
                      : Container(
                          child: Icon(
                          CupertinoIcons.game_controller,
                        )),
                ),
                //comments screen
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      _index = 2;
                      _currentScreen = CommentScreen();
                    });
                  },
                  child: _index == 2
                      ? Container(
                          height: 40,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Palette.purple,
                            borderRadius: BorderRadius.circular(19),
                            shape: BoxShape.rectangle,
                          ),
                          child: Icon(
                            CupertinoIcons.command,
                            color: Colors.white,
                          ))
                      : Container(
                          child: Icon(
                          CupertinoIcons.command,
                        )),
                ),
                //books
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      _index = 3;
                      _currentScreen = MessageScreen();
                    });
                  },
                  child: _index == 3
                      ? Container(
                          height: 40,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Palette.purple,
                            borderRadius: BorderRadius.circular(19),
                            shape: BoxShape.rectangle,
                          ),
                          child: Icon(
                            CupertinoIcons.rectangle_stack,
                            color: Colors.white,
                          ))
                      : Container(
                          child: Icon(
                          CupertinoIcons.rectangle_stack,
                        )),
                ),

                //profile
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      _index = 4;
                      _currentScreen = ProfileScreen();
                    });
                  },
                  child: _index == 4
                      ? Container(
                          height: 40,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Palette.purple,
                            borderRadius: BorderRadius.circular(19),
                            shape: BoxShape.rectangle,
                          ),
                          child: Icon(
                            CupertinoIcons.profile_circled,
                            color: Colors.white,
                          ))
                      : Container(
                          child: Icon(
                          CupertinoIcons.profile_circled,
                        )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
