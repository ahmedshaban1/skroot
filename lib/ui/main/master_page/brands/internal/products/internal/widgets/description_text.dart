import 'package:flutter/material.dart';
class CustomDescriptionText extends StatelessWidget {
  final String type ;
  final txt ;

  const CustomDescriptionText({Key key, this.type, this.txt}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(type),
        SizedBox(width: 5,),
        Text(txt , style: TextStyle(color: Colors.white),),

      ],
    );
  }
}
