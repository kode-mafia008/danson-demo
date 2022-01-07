import 'package:flutter/material.dart';
import 'package:vidyalayas/config/palette.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Palette.bgTextField,
        boxShadow: [
          BoxShadow(
            color: Palette.black.withOpacity(0.25),
            blurRadius: 4,
            offset: Offset(3, 4),
          )
        ],
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
