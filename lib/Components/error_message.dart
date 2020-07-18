import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String text;

  const ErrorMessage({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(text != null ? text : "لا يوجد اقسام حتى الان"),
      ),
    );
  }
}
