import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  static const String id = 'home-screen';
  const CommentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Comment Screen'),),
    );
  }
}
