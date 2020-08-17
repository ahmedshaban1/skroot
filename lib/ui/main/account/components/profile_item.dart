import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  final Icon icon ;
  final String text ;
  final Function onClick;

  const ProfileItem({Key key, this.icon, this.text, this.onClick}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child:Padding (
        padding: const EdgeInsets.all(9.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(shape: BoxShape.circle ,  color: Colors.black26 ),
                  child: icon,
                ),
                SizedBox(width: 10,),
                Text(text , style: TextStyle(color: Colors.white  , fontSize: 18 ),)
              ],
            ),
            Icon(Icons.arrow_forward_ios , size: 12, color: Colors.white
              ,)
          ],
        ),
      ),
    );
  }
}
