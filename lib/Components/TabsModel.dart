import 'package:flutter/material.dart';

class Choices extends StatelessWidget {
  final String title;

  Choices(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontFamily: 'cairo',
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold),
    );
  }
}
