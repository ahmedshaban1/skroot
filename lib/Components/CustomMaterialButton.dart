import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final String txt;

  final double width;

  final Color txtColor;
  final Color buttonColor;
  final double txtSize;

  final double radius;

  final Function function;
  final bool stateOfTheButton;
  final double height;

  final int superVisor;

  const CustomMaterialButton(
      {Key key,
      this.txt,
      this.width,
      this.txtColor,
      this.buttonColor,
      this.txtSize,
      this.radius,
      this.function,
      this.stateOfTheButton,
      this.height,
      this.superVisor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: width,
      height: height,
      color: buttonColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius))),
      onPressed: function,
      elevation: 2,
      child: Text(
        txt,
        style: TextStyle(
          fontFamily: 'cairo',
          color: txtColor,
          fontSize: txtSize,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
