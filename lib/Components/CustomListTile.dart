import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String listTxt;

  final IconData iconData;

  final Color txtColor;

  final Color iconColor;

  const CustomListTile(
      {Key key, this.listTxt, this.iconData, this.txtColor, this.iconColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(15),
        child: Text(
          listTxt,
          style: TextStyle(
            fontFamily: 'cairo',
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      
    );
  }
}
