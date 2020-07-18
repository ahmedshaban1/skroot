import 'package:flutter/material.dart';

class CustomTileDrawer extends StatefulWidget {
  final String title;

  final Color selectedColor;
  final Function onClicked;

  final IconData icon;

  const CustomTileDrawer(
      {Key key, this.title, this.onClicked, this.selectedColor, this.icon})
      : super(key: key);

  @override
  _CustomTileDrawerState createState() => _CustomTileDrawerState();
}

class _CustomTileDrawerState extends State<CustomTileDrawer> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: () {
          widget.onClicked();
        },
        child: Container(
          padding: EdgeInsets.only(right: 30, bottom: 8, top: 5),
          child: Row(
            children: <Widget>[
              Icon(widget.icon),
              SizedBox(
                width: 10,
              ),
              Text(
                widget.title,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cairo',
                    fontSize: 16.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
