import 'package:flutter/material.dart';

class FlatButtonRegister extends StatelessWidget {
  final Function _entryFunction;

  final String _buttonText;

  FlatButtonRegister(this._entryFunction, this._buttonText);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: _entryFunction,
        child: Text(
          _buttonText,
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'cairo',
            color: Colors.black,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ));
  }
}
