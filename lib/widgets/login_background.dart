import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: MediaQuery.of(context).padding.top,
            left: 0,
            child: Image.asset(
              '',
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              '',
              width: size.width * 0.45,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
