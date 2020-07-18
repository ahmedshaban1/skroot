import 'package:flutter/material.dart';

class CustomDialogCard extends StatefulWidget {
  final String name;

  const CustomDialogCard({Key key, this.name}) : super(key: key);

  @override
  _CustomDialogCard createState() => _CustomDialogCard();
}

class _CustomDialogCard extends State<CustomDialogCard> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      children: <Widget>[
        Text(widget.name, textAlign: TextAlign.right),
        SizedBox(height: 5),
        Divider(height: 1, color: Colors.grey),
        SizedBox(height: 5),
      ],
    );
  }
}
