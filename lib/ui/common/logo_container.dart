import 'package:flutter/material.dart';

class DrowLogo extends StatelessWidget {
  final double width, hight;

  const DrowLogo({Key key, this.width, this.hight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 100,
      height: hight ?? 100,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.contain)),
    );
  }
}
